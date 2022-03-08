#!/bin/bash
killall polybar ;

polybar --config=~/.config/polybar/i3 top &
