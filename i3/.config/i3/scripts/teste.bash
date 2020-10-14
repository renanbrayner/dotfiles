#===  FUNCTION  ================================================================
#         NAME:  usage
#  DESCRIPTION:  Display usage information.
#===============================================================================
function screenshot ()
{
  echo "$1" "$2"
}

#-----------------------------------------------------------------------
#  Handle command line arguments
#-----------------------------------------------------------------------

while getopts hvcm: opt
do
  case $opt in

  #c          )  echo "teste" ;;

  m          )  mode=$OPTARG echo `$mode`; exit 1 ;;
  
  esac    # --- end of case ---
done
shift $((OPTIND-1))

echo $mode
