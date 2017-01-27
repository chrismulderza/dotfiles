# Set proxy environmnet variables based on OSX scutil output, this should work with 
# network location changes too.

http_proxy=$(scutil --proxy | awk '/HTTPEnable/ { enabled = $3; } /HTTPProxy/ { server = $3; } /HTTPPort/ { port = $3; } END { if (enabled == "1") { print "http://" server ":" port; } }')
https_proxy=$(scutil --proxy | awk '/HTTPSEnable/ { enabled = $3; } /HTTPSProxy/ { server = $3; } /HTTPSPort/ { port = $3; } END { if (enabled == "1") { print "http://" server ":" port; } }')
ftp_proxy=$(scutil --proxy | awk '/FTPEnable/ { enabled = $3; } /FTPProxy/ { server = $3; } /FTPPort/ { port = $3; } END { if (enabled == "1") { print "http://" server ":" port; } }')
no_proxy="localhost,127.0.0.1,.dev,.local,192.168.56.0/24"

export http_proxy https_proxy ftp_proxy no_proxy
