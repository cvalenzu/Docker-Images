#!/bin/bash
#Compiling ACS
cd /ACS
# Source the bash profile needed to set environment variables to download and compile ACS
source LGPL/acsBUILD/config/.acs/.bash_profile.acs
# Clean the directory where the tools will be built.
git clean -d -f LGPL
export MAKE_NOSTATIC=yes; export MAKE_NOIFR_CHECK=on
# Paste the output logs from jenkins
make 2>&1 |tee build.summary
