FROM openjdk:8-jre-alpine

USER root

ENV VERSION=1.2.0 \
    JAVA_MX=1G

RUN apk update
RUN apk add wget ca-certificates bash
RUN update-ca-certificates

# Get OpenTripPlanner
ADD https://repo1.maven.org/maven2/org/opentripplanner/otp/$VERSION/otp-$VERSION-shaded.jar /deployments/
RUN ln -s otp-$VERSION-shaded.jar /deployments/otp.jar

# Create easy executable for OTP
ADD otp /usr/local/bin/
RUN chmod 755 /usr/local/bin/*

# Prepare data directory
RUN mkdir -p /data
RUN chmod 777 /data

ADD run.sh /opt/run-java/run-java.sh
RUN chmod 750 /opt/run-java/run-java.sh

USER 1001
