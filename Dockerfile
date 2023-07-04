FROM tomcat:9.0.76-jdk21-openjdk-slim

COPY target/*.war /usr/local/tomcat/webapps
