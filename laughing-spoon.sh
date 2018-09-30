#! /bin/bash

#THIS SETS THE VARIABLES TO BOLD TEXT
bold=$(tput bold)
normal=$(tput sgr0)
currentDate=`date`
#ONCE THESE VARIABLES ARE SET, BOLD/UNBOLD "TEXT" BY PUTTING ${bold}"TEXT"${normal}
echo "Checking dependencies..."
sleep 0.5

surryaa() {
    if command -v surya --help>/dev/null; then
        echo ${bold}"Dependency Surya passed."${normal}
    else
        echo "Dependency Surya not passed. Install Surya to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
	exit
    fi
}
sleep 0.5
surryaa
sleep 0.3

enPeeEm() {
    if command -v dot --help>/dev/null; then
        echo ${bold}"Dependency graphviz passed."${normal}
    else
        echo "Dependency graphviz not passed. Install graphviz to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
	exit
    fi
}
sleep 0.4

sleep 0.9
enPeeEm 
sleep 0.5

echo "${bold}Welcome to cdili-tanktop, a minimally-interactive bash script that automates pre-assessment (scoping) phase of security audits on Solidity code bases.${normal}.
"
sleep 2

echo "Shell directory: ${bold}$BASH${normal}"
sleep .5
echo "Shell version: ${bold}$BASH_VERSION${normal}"
sleep .5
echo "Home directory: ${bold}$HOME${normal}"
sleep .5
echo "Working directory: ${bold}$PWD${normal}
"
sleep 1.5
echo "${bold}tanktop.sh${normal} needs to point to the root directory of your smart contract system.
"
sleep 1

read -e -p "Please enter the directory of the contract system to be assessed: " contractRoot

echo ${bold}"Counting Solidity files."${normal}
sleep 0.5
find $contractRoot -name '*.sol' | wc -l > scopingReport.out
echo ${bold}"Solidity file count saved to ./scopingReport.out"${normal}
sleep 0.5
echo ${bold}"Counting lines of Solidity Code."${normal}
sleep 0.5
find $contractRoot -name '*.sol' | xargs wc -l >> scopingReport.out
echo ${bold}"Solidity line count saved to ./scopingReport.out"${normal}
sleep 0.5
echo "Analyzing the number and nature of functions with ${bold}Surya${normal}"
surya describe $contractRoot/**/*/*.sol >> scopingReport.out
echo "Surya description saved to ./scopingReport.out"
sleep 0.1
echo "Creating inheritance graph with ${bold}Surya${normal}"
sleep 0.5
surya inheritance $contractRoot/**/*/*.sol | dot -T png > inheritanceGraph.png
echo "Inheritance graph generated. Saved to ./inheritanceGraph.png"
sleep 0.1
echo "Generating call graph with ${bold}Surya${normal}"
surya callgraph $contractRoot/**/*/*.sol | dot -T png > callGraph.png
sleep 0.5
echo "Call graph generated. Saved to callGraph.png"
sleep 0.5
echo "
Scoping complete. Results printed to scopingReport.out, inheritanceGraph.png, and callGraph.png"

