#!/bin/bash
cd /ACS

export ACS_RETAIN=1
export ANT_HOME=/usr/share/ant
if [ -v $JAVA_HOME ]; then
        export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk.x86_64/
fi
echo "using java in:$JAVA_HOME"

# Source the bash profile needed to set environment variables to download and compile ACS
source LGPL/acsBUILD/config/.acs/.bash_profile.acs
# Delete the previous dir where ACS was installed.
rm -rf $ALMASW_INSTDIR
# Create the dir where ACS going to be installed.
mkdir -p $ALMASW_INSTDIR

#Compiling ExtProds
cd ExtProd/PRODUCTS
find . -name "config.cache" | xargs rm -rf

./download-products.sh
cd ../INSTALL
sed -i '210s/.*/\techo "Skipping Ant"/' buildTools

./buildTools  2>&1 |tee build.summary

git checkout buildTools
cd $ALMASW_INSTDIR
find -name "*.o" | xargs rm -rf
