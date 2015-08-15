#!/bin/bash

# download ossec from src 
#reference:https://github.com/ossec/ossec-hids/blob/master/README.md 
set -o errexit 
ossec_version="2.8.2" 
ossec_checksum="a0f403270f388fbc6a0a4fd46791b1371f5597ec" 
wget https://github.com/ossec/ossec-hids/archive/${ossec_version}.tar.gz 
mv ${ossec_version}.tar.gz ossec-hids-${ossec_version}.tar.gz 
if [ `uname` == "Darwin" ] 
then
    checksum=$(shasum ossec-hids-${ossec_version}.tar.gz | cut -d" " -f1)
else 
    checksum=$(sha1sum ossec-hids-${ossec_version}.tar.gz | cut -d" " -f1)
fi 
if [ $checksum == $ossec_checksum ]
then 
    tar xfz ossec-hids-${ossec_version}.tar.gz 
    echo "src downlaoded to $PWD/ossec-hids-${ossec_version}"
cd ossec-hids-${ossec_version} 
    echo "###################"
    echo "To install --> run :   sudo ./install.sh  "
    echo "###################"
else 
    "Wrong checksum. Download again orcheck if file has been tampered with."
fi

