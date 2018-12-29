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

mythRun() {
  printf "# Mythril Output\n" |& tee -a Audit_Tools_Report.md 
  
  for file in $filteredVar
do
  myth -x $file |& tee -a Audit_Tools_Report.md 
done
}

maruRun() {
  mkdir tmp
  cp $filteredVar ./tmp/
  printf "# Maru Output\n" |& tee -a Audit_Tools_Report.md 
  maru -r tmp |& tee -a Audit_Tools_Report.md 
  sleep 2
  rm -rf tmp 
}

solhintRun() {
  printf "# Solhint Output\n" |& tee -a Audit_Tools_Report.md
  solhint $filteredVar |& tee -a Audit_Tools_Report.md 
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

createReport() {
  printf "## Audit Tools Report\n" > Audit_Tools_Report.md
}

fileCount() {
  printf "## File Count \n" |& tee -a Audit_Tools_Report.md
    uF=$(unfilterFind | wc -l) 
    fF=$(filterFind | wc -l)
  printf "* **$uF** Solidity files exist in this contract system.\n" |& tee -a Audit_Tools_Report.md
  printf "* but, only **$fF** of those need audited.\n" |& tee -a Audit_Tools_Report.md

}


lineCount() {
    printf "## Line Count \n" |& tee -a Audit_Tools_Report.md
        uF2=$(unfilterFind | xargs wc -l | tail -1 | sed -e 's/total//g' | sed -e 's/^[[:space:]]*//'|sed 's/ //g')
        fF2=$(filterFind | xargs wc -l | tail -1 | sed -e 's/total//g' | sed -e 's/^[[:space:]]*//'|sed 's/ //g')
    printf "* **$uF2** Solidity lines exist in this contract system.\n" |& tee -a Audit_Tools_Report.md
    printf "* but, only **$fF2** of those need audited.\n" |& tee -a Audit_Tools_Report.md
}

suryaDescribe() {
    printf "### Surya Describe\n" |& tee -a Audit_Tools_Report.md
    surya describe $filteredVar | sed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g" |& tee -a Audit_Tools_Report.md
}

suryaParse(){
    printf "### Surya Parse\n" |& tee -a Audit_Tools_Report.md
    surya parse $filteredVar |& tee -a Audit_Tools_Report.md
}

suryaInheritance() {
  printf "## Inheritance Graph\n" |& tee -a Audit_Tools_Report.md
  printf "**Surya's Inheritance Graph** creates an exhaustive visualization of all function calls.\n" |& tee -a Audit_Tools_Report.md
  surya inheritance $filteredVar | dot -Tpng > InheritanceGraph.png
  printf "![Inheritance Graph](InheritanceGraph.png)"\n |& tee -a Audit_Tools_Report.md
}

suryaMdReport() {
    printf "## Markdown Report\n" |& tee -a Audit_Tools_Report.md 
    printf "**Surya's Markdown Report** gives an eagle-eye view of a smart contract system's inner workings. It displays:\n"  |& tee -a Audit_Tools_Report.md
    printf "* Files to be audited, along with their SHA-1 hash. \n" |& tee -a Audit_Tools_Report.md
    printf "* The directory of each file in the contract system. \n" |& tee -a Audit_Tools_Report.md
    printf "* The description table of all contracts (surya describe.) \n" |& tee -a Audit_Tools_Report.md
    printf "* Click [here](MDReport.md) to view Surya's Markdown Report. \n" |& tee -a Audit_Tools_Report.md
      surya mdreport MDReport.md $filteredVar
      cat MDReport.md |& tee -a Audit_Tools_Report.md
      rm MDReport.md
}

suryaCall() {
  printf "## Call Graph\n" |& tee -a Audit_Tools_Report.md
  printf "**Surya's Call Graph** creates an exhaustive visualization of all function calls.\n" |& tee -a Audit_Tools_Report.md
  surya graph $filteredVar | dot -Tpng > CallGraph.png
  printf "![Call Graph](CallGraph.png)"\n |& tee -a Audit_Tools_Report.md
}

checkDeps() {
suryaCheck
graphvizCheck
solcCheck
mythCheck
maruCheck
solhintCheck
}

scope() {
checkDeps
createReport
printf "# Scoping Report \n" >> Audit_Tools_Report.md
createFilteredVars
lineCount
fileCount
suryaDescribe
suryaParse
suryaInheritance
suryaCall
suryaMdReport
}

analyze() {
createReport
printf "# Analysis Report \n" >> Audit_Tools_Report.md
createFilteredVars
mythRun
maruRun
solhintRun
}

envPrt () {
printf "\e[1mShell directory:\e[0m $BASH
\e[1mShell version:\e[0m $BASH_VERSION
\e[1mWorking directory:\e[0m $PWD \n"
}




#!/bin/bash
 
while getopts ":hcs:a:l:" opt; do
  case $opt in
    h)
      printf "\e[1m Audit Tools v 0.1.5\e[0m\n"
      printf "\n"
      printf " \e[4mUsage\e[0m: \e[2m./audit-tools -l /home/user/contractDir\e[0m\n\n"
      printf "\e[1m Option    Description\e[0m\n"
      printf "   -h     This help text. \n"
      printf "   -c     Check for dependencies. \n"
      printf "   -s     Run scoping.\n"
      printf "   -a     Run analysis.\n"
      printf "   -l     Run all.\n"
      exit
      ;;
    c)
      envPrt
      checkDeps
      exit
      ;;
    s)
      rm Audit_Tools_Report.md
      rootDir=$OPTARG
      scope
      exit
      ;;
    a)
      rm Audit_Tools_Report.md
      rootDir=$OPTARG
      analyze
      exit
      ;;
    l)
      rm Audit_Tools_Report.md
      rootDir=$OPTARG
      scope
      analyze
      exit
      ;;

    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

      printf "\e[1m Audit Tools v 0.1.5\e[0m\n"
      printf "\n"
      printf " \e[4mUsage\e[0m: \e[2mOdyssey-Audit-Tool/bin/audit-tools.sh -l /home/user/contractDir\e[0m\n\n"
      printf "\e[1m Option    Description\e[0m\n"
      printf "   -h     This help text. \n"
      printf "   -c     Check for dependencies. \n"
      printf "   -s     Run scoping.\n"
      printf "   -a     Run analysis.\n"
      printf "   -l     Run all.\n"

