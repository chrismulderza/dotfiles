# Set Java Home

if which java &> /dev/null; then
  JAVA_HOME=$(/usr/libexec/java_home)
  export JAVA_HOME
fi

