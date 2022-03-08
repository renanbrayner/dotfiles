#!/bin/bash
while true
do
  read $1
  if [ "$1" == "ok" ]; then
    chromium
  fi
done
ok
