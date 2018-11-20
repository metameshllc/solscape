# Audit Tools
A bash script for scoping Solidity code bases during the pre-assessment phase of a security audit. 


## Dependencies
- `globstar` is enabled by default at the beginning of the script with `shopt -s globstar`. This allows scoping any directory's `.sol` files using a single wildcard lookup. `cinderspoon.sh` can't run properly without it.
- `surya` Surya is a smart contract analysis tool. It provides many tools for breaking apart smart contracts and understanding them, including inheritance graphs, call graphs, and function breakdowns. Install globally with node package manager: `npm install -g surya`. This allows `cinderspoon.sh` to call it from the command line.
- `graphviz` (Graphviz)[https://www.graphviz.org/download/] is required by Surya for its data visualization functions. Click (here)[https://www.graphviz.org/download/] for a list of downloads by operating system. Or on apt, `apt install graphviz`.

## Functionality

The operation of this script is dependent on the existence of .sol files inhabiting subdirectories of the main directory, or the main directory itself. It will not work unless _all_ of the .sol files you need scoped are in the main directory and/or its subdirectories _and_ all the files to be scoped are written in Solidity. This tool does not scope any files other than Solidity files.

## Future Versions
Should:
- Automatically exclude lines in files we've audited before or that don't need scoped for some other reason (e.g., the 0x contracts.)
- Apply some more cool automatic searching/sorting of .sol files to the generic output. (pattern recognition and extrapolating from large data samples, to name a few)
- Report as an MD file instead of a plaintext outfile.
 
## Testing

To test the functionality of cinderspoon.sh, Solidity files can be found in the soltest folder.
