# **E4S-Info Commands**
*A collection of command line tools that inform and educate E4S users*

## Table of Contents
- [Problem Statement](https://github.com/Collegeville/e4s-info#problem-statement)
- [Requirements](https://github.com/Collegeville/e4s-info#requirements)
- [Design Details Overview](https://github.com/Collegeville/e4s-info#design-details-overview)
- [Specific Design Details](https://github.com/Collegeville/e4s-info#specific-design-details)
- [Installment](https://github.com/Collegeville/e4s-info#installment)
- [Running the Command](https://github.com/Collegeville/e4s-info#running-the-command)
- [License](https://github.com/Collegeville/e4s-info#license)

## Problem Statement
*E4S should have a interesting, interactive way to learn more about who, what, where, why, and how the E4S Software was built.*

## Requirements
- Must be easily buildable by the E4S Software
- Must have few/zero dependencies
- Must be a command that can run from the terminal
- Must be able to take the index of the answer as a parameter if a datafile is specified

## Design Details Overview
The software is a command that is available to run in the termianl. The command is built on bash script to reduce dependencies. Heavy influences on design choices were the fortune command that runs in the terminal and other fortune commands available on GitHub.
- fortune command in VMWare Terminal
- why command in MatLab
- [shlomif/fortune-mod]
- [ruanyf/fortunes]
- [bmc/fortunes]

## Specific Design Details
- **Datafile**
    - Use the character \"\%\" as a delimiter
      - This decision was made by looking at the fortune codes on GitHub
      - Examples: [shlomif file], [ruanyf file], [bmc file]
    - The indentation output in the terminal is dependent on the datafile so authors have the choice to provide more entertaining entries.
- **Executable**
    - Made using a shell script in order to have fewer dependencies
- **Arguments**
    - No arguments are required to run the commands
    - why, who, what, where, and how arguments are used if a certain type of response is desired
    - Specific indexes can be accessed by using a valid -# option
- **Options**
    - Specific indexes can be chosen by using a valid -# option
    - The use of an index is only valid if a valid argument is specified first
- **Exit Status**
    - 0 if okay
    - 1 if invalid option is provided
    - 2 if datafile cannot be found

## Installment
Please visit [INSTALL.md](INSTALL.md) to view the installation instructions.

## Running the Command
- No Arguments
    - Example: `e4s-info`
    - Result: Prints a randomly selected entry from a randomly selected data file
- One Argument
    - Example: `e4s-info how`
    - Result: Prints a randomly selected entry from the specified data file, in this case the how.data file
- Two Arguments
    - Example: `e4s-info why -2`
    - Result: Prints the third entry from the specified data file, in this case the third entry from the why.data file

## License
Please visit [LICENSE](LICENSE) to view the license for this repository.



[//]: #

[shlomif/fortune-mod]: <https://github.com/shlomif/fortune-mod>
[ruanyf/fortunes]: <https://github.com/ruanyf/fortunes>
[bmc/fortunes]: <https://github.com/bmc/fortunes>
[shlomif file]: <https://github.com/shlomif/fortune-mod/blob/master/fortune-mod/datfiles/fortunes>
[ruanyf file]: <https://github.com/ruanyf/fortunes/blob/master/data/chinese>
[bmc file]: <https://github.com/bmc/fortunes/blob/master/fortunes>
