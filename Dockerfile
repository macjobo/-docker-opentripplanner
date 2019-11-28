FROM fabric8/java-jboss-openjdk8-jdk:1.5.1

ENV VERSION=1.2.0

ENV JAVA_APP_JAR otp.jar
ENV AB_ENABLED off
ENV AB_JOLOKIA_AUTH_OPENSHIFT true
ENV JAVA_OPTIONS -Xmx1024m -Djava.security.egd=file:///dev/./urandom

# Prepare data directory
#RUN mkdir -p /data
#RUN chmod 755 /data

EXPOSE 8080

ADD target/otp.jar /deployments/
