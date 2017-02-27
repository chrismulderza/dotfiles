# Set Java Home

if which java &> /dev/null; then
  JAVA_HOME=$(/usr/libexec/java_home)
  export JAVA_HOME
fi

if which grails &> /dev/null; then
  GRAILS_HOME=/usr/local/opt/grails/libexec
  export GRAILS_HOME
fi
