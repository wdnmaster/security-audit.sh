#!/bin/bash

# Script Author: Welid

# Check for input file
if [ -z "$1" ]; then
  echo "Usage: $0 <access_log_file>"
  exit 1
fi

echo "--- Security Audit Report for $1 ---"

# The Core Command Pipeline
awk '
  /Firefox\/45\.0/ {
    print "HIGH_RISK_UA: " $0
  }
  $9 == 401 {
    print "AUTH_FAIL: " $0
  }' "$1" | grep -c -E 'HIGH_RISK_UA|AUTH_FAIL'

echo "-------------------------------------"
