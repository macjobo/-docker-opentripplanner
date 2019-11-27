FROM redhat-openjdk-18/openjdk18-openshift

USER root

ENV VERSION=1.2.0 \
    JAVA_MX=1G

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
