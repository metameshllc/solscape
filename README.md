# Sol-Scope
A bash script for carrying out audit pre-assessment on Solidity code.

### Why use it?

* Automatically excludes trusted public libraries and audits.
* Saves repetitive entering of commands for scoping and tool analysis.

<kbd>
  <img src="https://github.com/chronaeon/audit-tools/blob/master/ss1.png?raw=true" style="margin-right:50px"; \>
</kbd>

## Scoping

Scoping is an essential part of audit _pre-assessment_ which has to do with understanding the dimensions of the files to be audited, and what kinds of work/how much work will an audit entail

#### Scoping Dependencies
- `globstar` is enabled by default at the beginning of the script with `shopt -s globstar`. This allows scoping any directory's `.sol` files using a single wildcard lookup. scoping functions in Audit Tools can't run properly without it.
- `surya` Surya is a smart contract analysis tool. It provides many tools for breaking apart smart contracts and understanding them, including inheritance graphs, call graphs, and function breakdowns. Install globally with node package manager: `npm install -g surya`. This allows Audit Tools to call it from the command line.
- `graphviz` [Graphviz](https://www.graphviz.org/download/) is required by Surya for its data visualization functions. Click [here](https://www.graphviz.org/download/) for a list of downloads by operating system. Or on apt, `apt install graphviz`.

#### Scoping Functionality

The operation of this script is dependent on the existence of .sol files inhabiting subdirectories of the main directory, or the main directory itself. It will not work unless _all_ of the .sol files you need scoped are in the main directory and/or its subdirectories _and_ all the files to be scoped are written in Solidity. This tool does not scope any files other than Solidity files.

## Tool Analysis

#### Mythril
For each Solidity file, performs a Mythril analysis.

##### Mythril Dependencies
Mythril requires Python 3 to run. Mythril's dependencies will be automatically installed when installing Mythril with `python3-pip`.

#### Solhint
For each Solidity file, performs a Solhint analysis.

### Future Versions
Should:
- Apply some more cool automatic searching/sorting of .sol files to the generic output. (pattern recognition and extrapolating from large data samples, to name a few)
 
### Viewing the Report
It is recommended to use `grip` to view the report, which is generated in Markdown.
To install `grip`, type

`pip install grip`

then

`$ grip /path/to/report/Audit_Tools_Report.md`
