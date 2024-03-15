#!/bin/sh
set -eux

SONAR_SCANNER_VERSION=4.0.0.1744

# Only install java if not already present (to avoid conflicting Java version)
arg_java=""
if ! which java >/dev/null; then
  arg_java=openjdk8-jre
fi

apk add --no-cache \
  ca-certificates \
  curl \
  $arg_java

mkdir -p /opt
curl -fSL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip -o /opt/sonar-scanner.zip
unzip /opt/sonar-scanner.zip -d /opt
rm /opt/sonar-scanner.zip
ln -s /opt/sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner /usr/bin/sonar-scanner
