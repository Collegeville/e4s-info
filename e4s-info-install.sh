#!/usr/bin/sh

argError()
{
	echo
	echo "Invalid arguments -- \"$ARGS\""
	echo "Please use \"./e4s-info-install.sh -h\" or \"./e4s-info-install.sh --help\" to display more information"
	echo
	exit 1
}

argPath()
{
	echo
	echo "No access to directory: FIXME"
	echo "Please use \"./e4s-info-install.sh -h\" or \"./e4s-info-install.sh --help\" to display more information"
	echo
        exit 2
}

help()
{
	# Display Help
        echo "Usage: ./install.sh [OPTION]... [DIRECTORY]... "
        echo "Installs the e4s-info command and command manual"
	echo
        echo "Options:"
        echo "  -h	--help		Displays information about the command"
        echo "  --prefix=foo		Specifies the directory the e4s-info command will reside after execution; the path must be"
        echo "  --mandir=foo		Specifies the directory the manual entry for the e4s-info command will reside after execution"
	echo
        echo "Examples"
        echo "  ./install.sh						Installs the e4s-info command and manual files in the default locations, which are /usr/local/bin/ and /usr/local/share/man/man1/ respectively"
        echo "  ./install.sh --prefix=~/bin/				Installs the e4s-info command in ~/bin/ and the manual file in the default location"
	echo "  ./install.sh --mandir=~/man/man1/			Installs the e4s-info command in the default location and the manual file in ~/man/man1"
	echo "  ./install.sh --prefix=~/bin/ --mandir=~/man/man1/	Installs the e4s-info command in ~/bin/ and the manual file in ~/man/man1/"
	echo "  sudo ./install.sh					Installs the e4s-info command and manual files in the default locations, but uses sudo if permission was denied without sudo"
        echo
        echo "Exit Status:"
        echo " 0  if okay"
        echo " 1  if invalid arguments are passed"
        echo " 2  if an invalid --prefix=foo or --mandir is passed"
	echo " 3  if there is an error while making a directory or copying files"
        echo
	exit 0
}


ARGS=$*
PATHVAR=
MANPATHVAR=

while [ "$1" != "" ]; do
    case $1 in
    --prefix=*)
        PATHVAR="$(echo "$1" | cut -c 10-)"
	;;
    --mandir=*)
        MANPATHVAR="$(echo "$1" | cut -c 10-)"
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
if [ -z "$PATHVAR" ]; then
	echo "Setting command PATH to default (/usr/local/bin/)"
	PATHVAR="/usr/local/bin/"
else
	echo "Using specified command PATH"
	PATHVAR1=$(dirname "$PATHVAR")
	PATHVAR2=$(basename "$PATHVAR")
	PATHVAR="${PATHVAR1}/${PATHVAR2}/"
fi

echo

echo "Checking command MANPATH..."
if [ -z "$MANPATHVAR" ]; then
	echo "Setting command MANPATH to default (/usr/local/share/man/man1/)"
	MANPATHVAR="/usr/local/share/man/man1/"
else
	echo "Using specified command MANPATH"
	MANVAR1=$(dirname "$MANPATHVAR")
	MANVAR2=$(basename "$MANPATHVAR")
	MANPATHVAR="${MANVAR1}/${MANVAR2}/man/man1/"
fi

echo

echo "PATH for command will be set to: $PATHVAR"
echo "MANPATH for the manual page will be set to: $MANPATHVAR"

echo

echo "Copying e4s-info command to $PATHVAR"

mkdir -p "$PATHVAR"
[ $? -eq 0 ] || { echo "Problems making directory: $PATHVAR. Either use \"sudo\" before command if permission was denied, check target directory for name collisions, or check the command \"mkdir\" error code: $?"; echo; exit 3; }
echo "Directory either already exists or was created"
cp -r e4s-info-command/ "$PATHVAR"
[ $? -eq 0 ] || { echo "Problems copying command. Either use \"sudo\" before command if permission was denied, check target directory for name collisions, or check the command \"cp\" error code: $?"; echo; exit 3; }

echo "Successfully copied e4s-info command to $PATHVAR"

echo

echo "Copying e4s-info manual file to $MANPATHVAR"
mkdir -p "$MANPATHVAR"
[ $? -eq 0 ] || { echo "Problems making directory $MANPATHVAR. Either use \"sudo\" before command if permission was denied, check target directory for name collisions, or check the command \"mkdir\" error code: $?"; echo; exit 3; }
echo "Directory either already exists or was created"
cp e4s-info-manual/e4s-info.1.gz "$MANPATHVAR"
[ $? -eq 0 ] || { echo "Problems copying manual file. Either use \"sudo\" before command if permission was denied, check target directory for name collisions, or check the command \"cp\" error code: $?"; echo; rm -r "${PATHVAR}e4s-info-command/"; exit 3; }

echo

echo "Successfully installed \"e4s-info\" command and manual page."
echo
EXTPATHVAR="${PATHVAR}e4s-info-command"
echo "If $EXTPATHVAR is not in your PATH, you will not be able to run the command. To run the command in your current shell, run the following command: export PATH=\$PATH:$EXTPATHVAR"
echo "If you would like to keep these changes, you need to add the path to either your ~/.bashrc,  ~/.zshrc, ~/.kshrc, or ~/.cshrc file. For bash, this would look like the following: "
echo "     vim ~/.bashcr"
echo "     export PATH=\$PATH:$EXTPATHVAR"
echo "The export command would go at the bottom of the file."
echo
BASEMANPATH=$(dirname "$MANPATHVAR")
echo "Likewise, if $BASEMANPATH is not in your MANPATH, you will not be able to run \"man e4s-info\". To run the command in your current shell, run the following command: export MANPATH=\$MANPATH:$BASEMANPATH"
echo "Just like above, if you would like to keep these changes, you need to add the manpath. This will also depend on your specific system. For bash, this would look like the following: "
echo "     vim ~/.bashcr"
echo "     export MANPATH=\$MANPATH:$BASEMANPATH"
echo "The export command would go at the bottom of the file."
echo

exit 0
