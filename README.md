# laughing-spoon
A bash script for scoping Solidity code bases during the pre-assessment phase of a security audit. 


## Dependencies
- `globstar` is enabled by default at the beginning of the script with `shopt -s globstar`. This allows scoping any directory's `.sol` files using a single wildcard lookup. laughing-spoon.sh can't run properly without it.
- `surya` Surya is a smart contract analysis tool. It provides many tools for breaking apart smart contracts and understanding them, including inheritance graphs, call graphs, and function breakdowns. Install globally with node package manager: `npm install -g surya`. This allows laughing-spoon.sh to call it from the command line.
- `graphviz` (Graphviz)[https://www.graphviz.org/download/] is required by Surya for its data visualization functions. Click (here)[https://www.graphviz.org/download/] for a list of downloads by operating system. Or on apt, `apt install graphviz`.

## Planned Functionality

- Automatically exclude lines in files we've audited before or that don't need scoped for some other reason.
- Apply some more cool automatic searching/sorting of .sol files to the generic output.
- Report as an MD file instead of a plaintext outfile
- Improve formatting of output report. Right now it just looks like a lot of numbers if you don't know what the script is doing.
