# Fix Python App Deployed on Kubernetes Cluster
One of the DevOps engineers was trying to deploy a python app on Kubernetes cluster. Unfortunately, due to some mis-configuration, the application is not coming up. Please take a look into it and fix the issues. Application should be accessible on the specified nodePort.

The deployment name is python-deployment-datacenter, its using poroko/flask-demo-appimage. The deployment and service of this app is already deployed.

nodePort should be 32345 and targetPort should be python flask app's default port.

* fixed mispelled image in deployment file
* fixed wrong port number for flask app in service file