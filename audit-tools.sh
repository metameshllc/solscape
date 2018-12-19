#! /bin/bash

printf() { builtin printf "$*"; sleep 0.006; }
		
shopt -s globstar 



suryaCheck() {
    if command -v surya --help>/dev/null; then
    printf "Dependency Surya Passed\n"
    else
        printf "Dependency Surya not passed. Install Surya to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
      exit
    fi
}

graphvizCheck() {
    if command -v dot --help>/dev/null; then
      printf "Dependency Graphviz Passed\n"
    else
        printf "Dependency Graphviz Missing. Graphviz functions will fail."
      exit
    fi
}

solcCheck() {
    if command -v dot --help>/dev/null; then
      printf "Dependency Solc Passed\n"
    else
        printf "Dependency Solc Missing. Solc functions will fail."
      exit
    fi
}

mythCheck() {
    if command -v dot --help>/dev/null; then
    printf "Dependency Mythril Passed\n"
    else
        printf "Dependency Mythril Missing. Mythril functions will fail."
      exit
    fi
}


maruCheck() {
    if command -v dot --help>/dev/null; then
    printf "Dependency Maru Passed\n"
    else
        printf "Dependency Maru Missing. Maru functions will fail."
      exit
    fi
}

solhintCheck() {
    if command -v dot --help>/dev/null; then
    printf "Dependency Solhint Passed\n"
    else
        printf | "Dependency Solhint Missing. Solhint functions will fail."
      exit
    fi
}

#Manticore Check?
#Solhydra Check?
#Slither Check?

solcGen() {
  solc
}

mythRun() {
  printf "# Mythril Output\n" > AnalysisReport.md 
  
  for file in $filteredVar
do
  myth -x $file |& tee -a AnalysisReport.md 
done
}

maruRun() {
  mkdir tmp
  cp $filteredVar ./tmp/
  printf "# Maru Output\n" |& tee -a AnalysisReport.md 
  maru -r tmp |& tee -a AnalysisReport.md 
  sleep 2
  rm -rf tmp 
}

solhintRun() {
  printf "# Solhint Output\n" |& tee -a AnalysisReport.md
  solhint $filteredVar |& tee -a AnalysisReport.md 
}


unfilterFind() {
    find $rootDir -name "*.sol" | \
    grep -v node_modules | \
    grep -v coverageEnv
}

filterFind() { 
    find $rootDir -name "*.sol" | \
    grep -v test* | \
    grep -v Migration* | \
    grep -v mock* | \
    grep -v Mock* | \
    grep -v Test* | \
    grep -v 0x | \
    grep -v Kyber* | \
    grep -v Bytes32.sol | \
    grep -v Authorizable.sol | \
    grep -v AddressArrayUtils.sol | \
    grep -v CommonMath.sol | \
    grep -v node_modules | \
    grep -v coverageEnv  | \
    grep -v openzeppelin-solidity | \
    grep -v cryptofin-solidity
}

createFilteredVars() {
  filteredVar=$(filterFind)
  unfilteredVar=$(unfilterFind)
}


fileCount() {
  printf "## File Count \n" |& tee -a report.md
    uF=$(unfilterFind | wc -l) 
    fF=$(filterFind | wc -l)
  printf "* **$uF** Solidity files exist in this contract system.\n" |& tee -a report.md
  printf "* but, only **$fF** of those need audited.\n" |& tee -a report.md

}


lineCount() {
    printf "## Line Count \n" |& tee -a report.md
        uF2=$(unfilterFind | xargs wc -l | tail -1 | sed -e 's/total//g' | sed -e 's/^[[:space:]]*//'|sed 's/ //g')
        fF2=$(filterFind | xargs wc -l | tail -1 | sed -e 's/total//g' | sed -e 's/^[[:space:]]*//'|sed 's/ //g')
    printf "* **$uF2** Solidity lines exist in this contract system.\n" |& tee -a report.md
    printf "* but, only **$fF2** of those need audited.\n" |& tee -a report.md
}

suryaDescribe() {
    printf "### Surya Describe\n" |& tee -a report.md
    surya describe $filteredVar | sed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g" |& tee -a report.md
}

suryaParse(){
    printf "### Surya Parse\n" |& tee -a report.md
    surya parse $filteredVar |& tee -a report.md
}

suryaInheritance() {
  printf "## Inheritance Graph\n" |& tee -a report.md
  printf "**Surya's Inheritance Graph** creates an exhaustive visualization of all function calls.\n" |& tee -a report.md
  surya inheritance $filteredVar | dot -Tpng > InheritanceGraph.png
  printf "![Inheritance Graph](InheritanceGraph.png)"\n |& tee -a report.md
}

suryaMdReport() {
    printf "## Markdown Report\n" |& tee -a report.md 
    printf "**Surya's Markdown Report** gives an eagle-eye view of a smart contract system's inner workings. It displays:\n"  |& tee -a report.md
    printf "* Files to be audited, along with their SHA-1 hash. \n" |& tee -a report.md
    printf "* The directory of each file in the contract system. \n" |& tee -a report.md
    printf "* The description table of all contracts (surya describe.) \n" |& tee -a report.md
    printf "* Click (here)[MDReport.md] to view Surya's Markdown Report. \n" |& tee -a report.md
      surya mdreport MDReport.md $filteredVar && cat MDReport.md |& tee -a report.md
}

suryaCall() {
  printf "## Call Graph\n" |& tee -a report.md
  printf "**Surya's Call Graph** creates an exhaustive visualization of all function calls.\n" |& tee -a report.md
  surya graph $filteredVar | dot -Tpng > CallGraph.png
  printf "![Call Graph](CallGraph.png)"\n |& tee -a report.md
}

checkDeps () {
suryaCheck
graphvizCheck
solcCheck
mythCheck
maruCheck
solhintCheck
}

scope() {
checkDeps
printf "# Scoping Report \n" > report.md
lineCount
fileCount
suryaDescribe
suryaParse
suryaInheritance
suryaMdReport
}

envPrt () {
printf "\e[1mShell directory:\e[0m $BASH
\e[1mShell version:\e[0m $BASH_VERSION
\e[1mWorking directory:\e[0m $PWD \n"
}




#!/bin/bash
 
while getopts ":hdc" opt; do
  case $opt in
    h)
      printf "\n"
      printf " \e[1mUsage:\e[0m"
      printf "\e[1m    Call      Option  User Input   Description\e[0m\n\n"
      printf "        audit-tools    -h                 This help text. \n"
      printf "        audit-tools    -d    \e[2m/exa/mple\e[0m    Solidity directory. \n"
      printf "        audit-tools    -c                 Check for dependencies. \n"
      printf "        audit-tools    -s                 Run scoping."
      ;;
    c)
      envPrt
      checkDeps
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

