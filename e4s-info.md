# **E4S Info Commands**

## *All Completed Commands*
- e4s-info-why

## *Future Possible Commands*
- e4s-info-who
- e4s-info-what
- e4s-info-where
- e4s-info-how

### Problem Statement
*E4S should have a interesting, interactive way to learn more about why (and possibly who, what, where, and how in the future) the E4S Software was built.*

### Requirements:
- Must be easily buildable by the E4S Software
- Must have few/zero dependencies
- Must be a command that can run from the terminal
- Must be able to take the index of the answer as a parameter

### Design Details Overview
The software is a command that is available to run in the termianl. The command is built on bash script. Heavy influences on design choices were the fortune command that runs in the terminal and other fortune commands available on GitHub.
- fortune command in VMWare Terminal
- why command in MatLab
- [shlomif/fortune-mod]
- [ruanyf/fortunes]
- 

### Specific Design Details
- **Datafile**
    - Use the character \"\%\" as a delimiter
      - This decision was made by looking at the fortune codes listed above
    - The indentation output in the terminal is dependent on the datafile so authors have the choice to provide more entertaining entries.
- **Executable**
    - Made using a shell script in order to have fewer dependencies
- **Options**
    - No options are required to run the commands
    - Specific indexes can be accessed by using a valid -# option
- **Exit Status**
    - 0 if okay
    - 1 if invalid option is provided
    - 2 if datafile connot be found


[//]: #

[shlomif/fortune-mod]: <https://github.com/shlomif/fortune-mod>
[ruanyf/fortunes]: https://github.com/ruanyf/fortunes
