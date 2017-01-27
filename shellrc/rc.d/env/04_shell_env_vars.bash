# Environment Variables

HOMEBREW_GITHUB_API_TOKEN=4984bcbaf782b5d97ba5317d71e9768e9891e857
http_proxy=$(proxy-config -h)
https_proxy=$(proxy-config -s)
ftp_proxy=$(proxy-config -f)

# For Vagrant proxy plugin

VAGRANT_HTTP_PROXY=$(proxy-config -h)
VAGRANT_HTTPS_PROXY=$(proxy-config -s)
VAGRANT_FTP_PROXY=$(proxy-config -f)
VAGRANT_NO_PROXY="localhost,127.0.0.1,.fr-prod.edcon.co.za,.ambari.apache.org,.dev,.local,192.168.65.101,192.168.65.102,192.168.65.103"


# Oracle Client 
DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/opt/oracle/client/11.2
ORACLE_HOME=/opt/oracle/client
TNS_ADMIN=/opt/oracle/client/11.2/network/admin

# Groovy (Homebrew)
GROOVY_HOME=/usr/local/opt/groovy/libexec

export HOMEBREW_GITHUB_API_TOKEN http_proxy https_proxy ftp_proxy DYLD_LIBRARY_PATH ORACLE_HOME TNS_ADMIN VAGRANT_HTTP_PROXY VAGRANT_HTTPS_PROXY VAGRANT_FTP_PROXY VAGRANT_NO_PROXY GROOVY_HOME


############## EDCON SOA ENVIRONMENT ####################

#/TODO: Split these out to a modularised section
#
# Oracle SOA
#
#EDCON_CODE_BASE=${HOME}/code/projects/edcon
#LOCAL_MDS_ROOT=${EDCON_CODE_BASE}/MAV1/trunk
#export LOCAL_MDS_ROOT

#
# JDEV
#
#JDEV_USER_DIR=/Users/cmulder/Projects/Edcon/config/jdev117
#JDEV_HOME=/opt/oracle/middleware/jdeveloper
#MY_JDEV_OPTIONS="-J-Dlocal.mds.root=$LOCAL_MDS_ROOT -J-Dfile.encoding=UTF-8"
#JDEV_TMP_DIR=/tmp
#ANT_HOME=/opt/oracle/middleware/modules/org.apache.ant_1.7.1
#JAVA_HOME=$(/usr/libexec/java_home)
# JDK 1.6 Home = /System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
#JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
#JAVA_HOME=/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home

#export JDEV_USER_DIR JDEV_HOME MY_JDEV_OPTIONS JDEV_TMP_DIR ANT_HOME JAVA_HOME

#
# TOOLBOX_ORA_FMW_UTIL
#
#TOOLBOX_HOME=/opt/frameworks/toolbox
#TOOLBOX_CXF_HOME=/opt/frameworks/apache-cxf-2.7.11
#TOOLBOX_ORA_FMW_UTIL_HOME=/opt/frameworks/tbmodules/toolbox_oracle_fmw_util
#ORACLE_MW_HOME=/opt/oracle/middleware
#OSB_HOME=$ORACLE_MW_HOME/osb_11.1.1.6

#PATH=$TOOLBOX_ORA_FMW_UTIL_HOME/bin:$ANT_HOME/bin:$JAVA_HOME/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

#export TOOLBOX_HOME TOOLBOX_CXF_HOME TOOLBOX_ORA_FMW_UTIL_HOME ORACLE_MW_HOME OSB_HOME PATH
