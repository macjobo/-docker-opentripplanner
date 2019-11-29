FROM fabric8/java-jboss-openjdk8-jdk:1.5.1

ENV JAVA_APP_JAR otp.jar
ENV AB_ENABLED off
ENV AB_JOLOKIA_AUTH_OPENSHIFT true
ENV JAVA_OPTIONS -Xmx1024m -Djava.security.egd=file:///dev/./urandom

ADD deployments/otp.jar /deployments/
ADD deployments/gtfs.zip /deployments/
ADD deployments/wien.osm /deployments/

# Define port
EXPOSE 8080

# Prepare script to be started when container comes up
ADD run.sh /opt/run-java/run-java.sh
