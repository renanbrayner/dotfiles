#!/usr/bin/env bash

function get_output() {
  if amixer get Master | grep -q off; then
    echo "true"
  else
    echo "false"
  fi
}

function get_input() {
  if amixer get Capture | grep -q off; then
    echo "true"
  else
    echo "false"
  fi
}

function mute_output() {
  pactl set-sink-mute @DEFAULT_SINK@ toggle;
  if amixer get Master | grep -q off; then
    eww update is_output_muted=true
  else
    eww update is_output_muted=false
  fi
}

function mute_input() {
  pactl set-source-mute @DEFAULT_SOURCE@ toggle
  if amixer get Capture | grep -q off; then
    eww update is_input_muted=true
  else
    eww update is_input_muted=false
  fi
}

while [ ! $# -eq 0 ]
do
  case "$1" in
    --watch-mute-output)
      get_output
      exit
      ;;
    --watch-mute-input)
      get_input
      exit
      ;;
    --watch-output)
      pamixer --get-volume
      exit
      ;;
    --watch-input)
      echo $(amixer get Capture | grep -Po 'L.+\[\K\d+')
      exit
      ;;
    --mute-output)
      mute_output
      exit
      ;;
    --mute-input)
      mute_input
  esac
  shift
done
