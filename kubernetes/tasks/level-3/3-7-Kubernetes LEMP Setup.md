# Kubernetes LEMP Setup
The Nautilus DevOps team want to deploy a static website on Kubernetes cluster. They are going to use Nginx, phpfpm and MySQL for the database. The team had already gathered the requirements and now they want to make this website live. Below you can find more details:

Create some secrets for MySQL.

Create a secret named mysql-root-pass wih key/value pairs as below:

name: password
value: R00t

Create a secret named mysql-user-pass with key/value pairs as below:

name: username
value: kodekloud_top

name: password
value: GyQkFRVNr3

Create a secret named mysql-db-url with key/value pairs as below:

name: database
value: kodekloud_db7

Create a secret named mysql-host with key/value pairs as below:

name: host
value: mysql-service

Create a config map php-config for php.ini with variables_order = "EGPCS" data.

Create a deployment named lemp-wp.

Create two containers under it. First container must be nginx-php-container using image webdevops/php-nginx:alpine-3-php7 and second container must be mysql-container from image mysql:5.6. Mount php-config configmap in nginx container at /opt/docker/etc/php/php.ini location.

5) Add some environment variables for both containers:

MYSQL_ROOT_PASSWORD, MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWORD and MYSQL_HOST. Take their values from the secrets you created. Please make sure to use env field (do not use envFrom) to define the name-value pair of environment variables.

6) Create a node port type service lemp-service to expose the web application, nodePort must be 30008.

7) Create a service for mysql named mysql-service and its port must be 3306.

We already have a /tmp/index.php file on jump_host server.

Copy this file into the nginx container under document root i.e /app and replace the dummy values for mysql related variables with the environment variables you have set for mysql related parameters. Please make sure you do not hard code the mysql related details in this file, you must use the environment variables to fetch those values.

Once done, you must be able to access this website using Website button on the top bar, please note that you should see Connected successfully message while accessing this page.

## create secrets
`kubectl create secret generic mysql-root-pass --from-literal=password=R00t`
`kubectl create secret generic mysql-user-pass --from-literal=username=kodekloud_top`
`kubectl create secret generic mysql-db-url --from-literal=database=kodekloud_db7`
`kubectl create secret generic mysql-host --from-literal=host=mysql-service`
## create config map
`kubectl create configmap php-config --from-literal variables_order="EGPCS"`
## create deployment
```
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: lemp-wp
  name: lemp-wp
spec:
  selector:
    matchLabels:
      app: lemp-wp
  template:
    metadata:
      labels:
        app: lemp-wp
    spec:
      containers:
      - image: webdevops/php-nginx:alpine-3-php7
        name: nginx-php-container
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-root-pass
              key: password
        - name: MYSQL_DATABASE
          valueFrom:
            secretKeyRef:
              name: mysql-db-url
              key: database
        - name: MYSQL_USER
          valueFrom:
            secretKeyRef:
              name: mysql-user-pass
              key: username
        - name: MYSQL_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-user-pass
              key: password
        - name: MYSQL_HOST
          valueFrom:
            secretKeyRef:
              name: mysql-host
              key: host
      - image: mysql:5.6
        name: mysql-container
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-root-pass
              key: password
        - name: MYSQL_DATABASE
          valueFrom:
            secretKeyRef:
              name: mysql-db-url
              key: database
        - name: MYSQL_USER
          valueFrom:
            secretKeyRef:
              name: mysql-user-pass
              key: username
        - name: MYSQL_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-user-pass
              key: password
        - name: MYSQL_HOST
          valueFrom:
            secretKeyRef:
              name: mysql-host
              key: host
        volumeMounts:
        - name: php-config-volume
          mountPath: /opt/docker/etc/php/php.ini
          subPath: php.ini
      volumes:
      - name: php-config-volume
        configMap:
          name: php-config
```
## create service
```
---
apiVersion: v1
kind: Service
metadata:
  name: lemp-service
spec:
  type: NodePort
  selector:
    app: lemp-wp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
    nodePort: 30008
---
apiVersion: v1
kind: Service
metadata:
  name: mysql-service
spec:
  type: ClusterIP
  selector:
    app: lemp-wp
  ports:
  - protocol: TCP
    port: 3306
    targetPort: 3306
```
## edit and fix php file
```
<?php
$dbname = getenv('MYSQL_DATABASE');
$dbuser = getenv('MYSQL_USER');
$dbpass = getenv('MYSQL_PASSWORD');
$dbhost = getenv('MYSQL_HOST');

$connect = mysqli_connect($dbhost, $dbuser, $dbpass) or die("Unable to Connect to '$dbhost'");

$test_query = "SHOW TABLES FROM $dbname";
$result = mysqli_query($test_query);

if ($result->connect_error) {
   die("Connection failed: " . $conn->connect_error);
}
  echo "Connected successfully";
?>
```
## copy php index.php to container
`kubectl cp /tmp/index.php lemp-wp-749dfd5457-4f69m:/app --container nginx-php-container`

