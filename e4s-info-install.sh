#!/usr/bin/sh

# set -e

# trap 'errorHandler $LINENO' ERR

# mkdir -p /usr/local/bin/
# cp -r e4s-info-command/* /usr/local/bin/
# mkdir -p /usr/local/share/man/man1/
# cp e4s-info-manual/e4s-info.1.gz /usr/local/share/man/man1/

#################################
# argError			#
#################################
argError()
{
	echo "Invalid arguments -- \"$ARGS\""
	echo "Please use \"./e4s-info-install.sh -h\" or \"./e4s-info-install.sh --help\" to display more information"
	exit 1
}

#################################
# errorHandler			#
#################################
errorHandler()
{
	echo "An Error Occurred on $1"
	exit
}

#################################
# help				#
#################################
help()
{
	echo "Help Stuff"
	exit 0
}

#################################
#################################
# main program			#
#################################
#################################

ARGS=$*
PATHVAR=
MANPATHVAR=

while [ "$1" != "" ]; do
    case $1 in
    --path)
        shift
	PATHVAR=$1
        ;;
    --manpath)
        shift
        MANPATHVAR=$1
        ;;
    -h | --help)
        help # run help function
        ;;
    *)
        # invalid option
	argError
        ;;
    esac
    shift # remove the current value for `$1` and use the next
done

echo

echo "Checking command PATH..."
[ -z "$PATHVAR" ] && echo "Setting command PATH to default (/usr/local/bin/)" && PATHVAR="/usr/local/bin/" || echo "Using specified command PATH"
[ -d "$PATHVAR" ] && echo "Valid command PATH" || { echo -e "The directory does not exist. Please try again.\n" ; exit 1 ; }

echo

echo "Checking command MANPATH..."
[ -z "$MANPATHVAR" ] && echo "Setting command MANPATH to default (/usr/local/share/man/man1/)" && MANPATHVAR="/usr/local/share/man/man1/" || echo "Using specified command MANPATH"
[ -d "$MANPATHVAR" ] && echo "Valid command MANPATH" || { echo "The directory does not exist. Please try again.\n" ; exit 1 ; }

echo

echo "PATH for command will be set to: $PATHVAR"
echo "MANPATH for the manual page will be set to: $MANPATHVAR"

echo

exit 0
