#!/bin/bash
#Compiling ACS
cd /ACS

export ACS_RETAIN=1
export ANT_HOME=/usr/share/ant
if [ -v $JAVA_HOME ]; then
        export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk.x86_64/
fi
echo "using java in:$JAVA_HOME"


# Source the bash profile needed to set environment variables to download and compile ACS
source LGPL/acsBUILD/config/.acs/.bash_profile.acs
# Clean the directory where the tools will be built.
git clean -d -f LGPL
export MAKE_NOSTATIC=yes; export MAKE_NOIFR_CHECK=on
# Paste the output logs from jenkins
make 2>&1 |tee build.summary
