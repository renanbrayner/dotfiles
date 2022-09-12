#!/bin/bash
eww daemon
while [[ "$(eww windows)" != *"*bar"* ]]
do
  eww open bar
done
echo "Opened Window!"
