chmod +x /root/bin/next
export PATH=/root/bin:$PATH
export STEPFILE=/tmp/$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
next