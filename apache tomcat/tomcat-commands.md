## install java jdk with yum
`yum install java-1.8.0-openjdk-devel`
## download packages with wget
`wget https://downloads.apache.org/tomcat/ tomcat-8/v8.5.53/bin/apache-tomcat-8.5.53.tar.gz`
## extract archive
`tar xvf apache-tomcat-8.5.53.tar.gz`
## run startup script
`./apache-tomcat-8.5.53/bin/startup.sh`
## conf file in /conf
`server.xml`
## apps dir in /webapps
`app.war`
## verify
`cat ~/apache-tomcat-8.5.53/logs/catalina.out`
## default port 8080
`https://localhost:8080/app`
