# **Installation**

To install and have `e4s-info` and `man e4s-info` as runnable commands, please follow the instructions below.

### Cloning from GitHub

To obtain the code from GitHub, run the following command:
```
git clone https://github.com/Collegeville/e4s-info.git
```

### Running the Installation Script

To install the commands, run the e4s-info-install script.

The default location for the `e4s-info` command and cooresponding data files is /usr/local/bin.The default location for the `man e4s-info` manual page is /usr/local/share/man/man1/. These locations may require permissions to access, so it may be necessary to run the installation script with the `sudo` command.

If you wish to change the location of the `e4s-info` command and cooresponding data files, please use the `--prefix=/foo/bar/` argument. If you wish to change the location fof the `man e4s-info` manual page, please use the `--mandir=/foo/bar` argument. Please note that the installation script will automatically add the /bin/ directory to the end of the `--prefix=` argument and the /man/man1/ directory to the end of your specified `--mandir=` argument. Thus, if you wish for the command to be located in the /home/foo/bin/ directory, you would pass `--prefix=/home/foo/`. Likewise, if you wish for the manual page to be located in the /usr/share/man/man1/ directory, you would pass `--mandir=/usr/share/` as the argument. If you would like to see more information about the installation script, please use the `-h` or `--help` arguments.

```
sudo ./e4s-info-install.sh
```

### Persisting the Commands

To persist your changes to allow you to run the commands from anywhere, you must add the PATH of the `e4s-info` command to your $PATH and the MANPATH of your `man e4s-info` manual page to your $MANPATH. You need to export the PATH and MANPATH to either your ~/.bashrc, ~/.bash_profile, ~/.zshrc, ~/.kshrc, ~/.cshrc file, etc depending on your shell. 

For bash, open up either ~/.bashrc or ~/.bash_profile add add the following lines to the bottom of the file:
```
export PATH=$PATH:/foo/bar/bin/
export MANPATH=$MANPATH:/foo/bar/man/
```
