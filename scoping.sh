#! /bin/bash

echo() { builtin echo "$*"; sleep 0.5$RANDOM; }

#THIS SETS THE VARIABLES TO BOLD TEXT
bold=$(tput bold)
normal=$(tput sgr0)
currentDate=`date`
            
            echo "Checking dependencies..."


shopt -s globstar

surryaa() {
    if command -v surya --help>/dev/null; then
        echo "Dependency ${bold}Surya${normal} passed."

    else
        echo "Dependency Surya not passed. Install Surya to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
      exit
    fi
}


graffViz() {
    if command -v dot --help>/dev/null; then
        echo ${bold}"Dependency graphviz passed."${normal}
    else
        echo "Dependency graphviz not passed. Install graphviz to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
      exit
    fi
}
 

diallog() {
    if command -v dialog --help>/dev/null; then
        echo ${bold}"Dependency dialog passed."${normal}
    else
        echo "Dependency dialog not passed. Install dialog to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
      exit
    fi
}

surryaa
graffViz
diallog


 echo "Welcome to Audit Tools, an interactive script for automating pre-assessment and testing phases of security audits on Solidity code bases.
            "

            echo "Shell directory: \Zb\Z1$BASH$\Zn"
            echo "Shell version: ${bold}$BASH_VERSION${normal}"
            echo "Home directory: ${bold}$HOME${normal}"
            echo "Working directory: ${bold}$PWD${normal}
            "

            echo "${bold}Audit Tools${normal} needs to point to the root directory of your smart contract system.
            "

            read -e -p "Please enter the directory of the contract system to be assessed: " contractRoot
                


            echo ${bold}"Counting Solidity files."${normal}

            echo "Number of Solidity files in codebase: " > scopingReport.out

            find $contractRoot -name "*.sol" | grep -v test | grep -v Migrations* | grep -v mock | wc -l >> scopingReport.out

            echo " " >> scopingReport.out                                                                                           #Creates a visual line break in the report output.

            echo ${bold}"Solidity file count saved to ./scopingReport.out"${normal}
            echo ${bold}"Counting lines of Solidity Code."${normal}
                
            find $contractRoot -name "*.sol" | grep -v test | grep -v Migrations | grep -v mocks | xargs wc -l >> scopingReport.out

            echo " " >> scopingReport.out                                                                                           #Creates a visual line break in the report output.

            echo ${bold}"Solidity line count saved to ./scopingReport.out"${normal}
                    

            echo "Analyzing the number and nature of functions with ${bold}Surya${normal}"

            surya describe $contractRoot**/*.sol >> scopingReport.out 

            echo "Surya description saved to ./scopingReport.out"  
                    

            echo "Creating inheritance graph with ${bold}Surya${normal}"
                    
                
            surya inheritance $contractRoot**/*.sol | dot -T png > inheritanceGraph.png

            echo "Inheritance graph generated. Saved to ./inheritanceGraph.png"
                    

            echo "Generating call graph with ${bold}Surya${normal}"
            surya graph $contractRoot**/*.sol | dot -T png > callGraph.png

                
            echo "Call graph generated. Saved to callGraph.png"


            echo "
            Scoping complete. Results printed to scopingReport.out, inheritanceGraph.png, and callGraph.png"

            exit
