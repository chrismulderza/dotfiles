# Oracle Instanct Client


if [ -d  /opt/oracle/client/11.2 ]; then
    PATH=$PATH:/opt/oracle/client/11.2
    DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/opt/oracle/client/11.2
    ORACLE_HOME=/opt/oracle/client
    TNS_ADMIN=/opt/oracle/client/11.2/network/admin
fi

export PATH DYLD_LIBRARY_PATH ORACLE_HOME TNS_ADMIN
