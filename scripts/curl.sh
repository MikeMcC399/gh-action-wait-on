#!/bin/bash
#
# scripts/curl.sh <port>

defaultPort=8000
port="${1:-$defaultPort}"

echo -e "\ncheck localhost"
curl -I http://localhost:$port

echo -e "\ncheck 127.0.0.1"
curl -I http://127.0.0.1:$port

echo -e "\ncheck [::1]"
curl -I http://[::1]:$port

# ignore any errors and return success
exit 0
