#!/bin/bash

exec java -Xmx1024m -jar /deployments/otp.jar --build /data --analyst --inMemory
