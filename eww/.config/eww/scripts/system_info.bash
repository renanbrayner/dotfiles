while [ ! $# -eq 0 ]
do
  case "$1" in
    --static)
      echo \
"<span line_height='1.25'><b>OS:</b> $(cat /etc/os-release | grep -Po 'PRETTY.+\"\K[a-zA-Z0-9_\s]+')
<b>KERNEL:</b> $(uname -r)
<b>CPU:</b> AMD Ryzen 7 5700G
<b>GPU:</b> $(lspci -vnnn | perl -lne 'print if /^\d+\:.+(\[\S+\:\S+\])/' | grep -Po "VGA.+\. \K[\[A-Za-z\/\]]+\s[A-Za-z]+")
<b>GPU DRIVER:</b> $(lspci  -v -s  $(lspci | grep ' VGA ' | cut -d" " -f 1) | grep -Po "driver in use: \K.+")
<b>WM:</b> $DESKTOP_SESSION</span>"
      exit
      ;;
    --dynamic)
      echo \
"<span line_height='1.25'><b>PACKAGES:</b> $(pacman -Q | wc -l) ($(pacman -Qe | wc -l))
<b>UPTIME:</b> $(uptime -p)</span>"
  esac
  shift
done

# TODO: make the line bellow shorter (remove with graphics)
# <b>CPU:</b> $(cat /proc/cpuinfo | grep -Po "model name.+: \K[\w\s]+" | head -1)
