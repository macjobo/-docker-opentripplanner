FROM redhat-openjdk-18/openjdk18-openshift

USER root

# Get OpenTripPlanner
ADD https://repo1.maven.org/maven2/org/opentripplanner/otp/$VERSION/otp-$VERSION-shaded.jar /deployments/
RUN ln -s otp-$VERSION-shaded.jar /deployments/otp.jar

# Create easy executable for OTP
ADD otp /usr/local/bin/
RUN chmod 755 /usr/local/bin/otp

ADD assemble /usr/libexec/s2i/assemble
RUN chmod 750 /usr/libexec/s2i/assemble

ADD run /usr/libexec/s2i/run
RUN chmod 750 /usr/libexec/s2i/run

# Prepare data directory
RUN mkdir -p /data
RUN chmod 777 /data

USER 1001
