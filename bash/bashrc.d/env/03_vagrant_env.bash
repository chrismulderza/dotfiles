# For Vagrant proxy plugin

VAGRANT_HTTP_PROXY=$(scutil --proxy | awk '/HTTPEnable/ { enabled = $3; } /HTTPProxy/ { server = $3; } /HTTPPort/ { port = $3; } END { if (enabled == "1") { print "http://" server ":" port; } }')
VAGRANT_HTTPS_PROXY=$(scutil --proxy | awk '/HTTPSEnable/ { enabled = $3; } /HTTPSProxy/ { server = $3; } /HTTPSPort/ { port = $3; } END { if (enabled == "1") { print "http://" server ":" port; } }')
VAGRANT_FTP_PROXY=$(scutil --proxy | awk '/FTPEnable/ { enabled = $3; } /FTPProxy/ { server = $3; } /FTPPort/ { port = $3; } END { if (enabled == "1") { print "http://" server ":" port; } }')
VAGRANT_NO_PROXY="localhost,127.0.0.1,.dev,.local,192.168.56.0/24"

export VAGRANT_HTTP_PROXY VAGRANT_HTTPS_PROXY VAGRANT_FTP_PROXY VAGRANT_NO_PROXY
