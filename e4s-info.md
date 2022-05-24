# **E4S Info Commands**

## *All Completed Commands*
- e4s-info-why

### Problem Statement
*E4S should have a interesting, interactive way to learn more about why (and possibly who, what, where, and how in the future) the E4S Software was built.*

### Requirements:
- Must be easily buildable by the E4S Software
- Must have few/zero dependencies
- Must be a command that can run on its own
- Must be able to take the index of the answer as a parameter

### Non-Goals
- Store information about when, how, or in any manner whatsoever the commands were run

### Design Details Overview
The software is a command that is available to run in the termianl. The command is built on bash script. Heavy influences on design choices were the fortune command that runs in the terminal and other fortune commands available on GitHub.
- [shlomif/fortune-mod]
- Other designs here

### Specific Design Details
- **Datafile**
    - Use the character \"\%\" as a delimiter
      - This decision was made by looking at similar software as listed above
- **Options**
    - No options are required to run the commands
    - Specific indexes can be accessed by using a valid -# option
- **Exit Status**
    - 0 if okay
    - 1 if invalid option is provided
    - 2 if datafile connot be found


[//]: #

[shlomif/fortune-mod]: <https://github.com/shlomif/fortune-mod>
