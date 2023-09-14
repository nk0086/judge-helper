# judge-helper
`judge-helper` is a Neovim plugin designed to assist with solving problems on AtCoder. 
It simplifies the process of downloading test cases, testing, and submitting solutions by leveraging the oneline-judge-tools.

## Requirement

[online-judge-tools](https://github.com/online-judge-tools/oj/blob/master/docs/getting-started.ja.md)

## Functions

|        |                                                                                                                    |
|--------|--------------------------------------------------------------------------------------------------------------------|
|Download|Automatically downloads test cases based on the current file name without needing to manually input the problem URL.|
|Test    |Executes test cases using a specified command.                                                                      |
|Submit  |Submits your code based on the current file name without needing to manually input the problems URL.                |


## Filename Convention
For the plugin to work correctly, your solution file name should follow specific format: `contestID_problemID.extention`.
For example, if you're solving problem A from contest `abc123`, your file should be named `abc123_a.rs` (for Rust).

