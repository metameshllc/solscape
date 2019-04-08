#! /bin/bash

printf() { builtin printf "$*"; sleep 0.006; }
		
shopt -s globstar 



suryaCheck() {
    if command -v surya --help>/dev/null; then
    printf "\e[1mDependency Passed:\e[0m    Surya\n"
    else
        printf "Dependency Surya not passed. Install Surya to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
      exit
    fi
}

graphvizCheck() {
    if command -v dot --help>/dev/null; then
      printf "\e[1mDependency Passed:    \e[0mGraphviz\n"
    else
        printf "Dependency Graphviz Missing. Graphviz functions will fail."
      exit
    fi
}

solcCheck() {
    if command -v solc --help>/dev/null; then
      printf "\e[1mDependency Passed: \e[0m   Solc\n"
    else
        printf "Dependency Solc Missing. Solc functions will fail."
      exit
    fi
}

mythCheck() {
    if command -v myth --help>/dev/null; then
    printf "\e[1mDependency Passed:    \e[0mMythril  \n"
    else
        printf "Dependency Mythril Missing. Mythril functions will fail."
      exit
    fi
}


maruCheck() {
    if command -v maru --help>/dev/null; then
    printf "\e[1mDependency Passed:    \e[0mMaru\n"
    else
        printf "Dependency Maru Missing. Maru functions will fail."
      exit
    fi
}

solhintCheck() {
    if command -v solhint --help>/dev/null; then
    printf "\e[1mDependency Passed:    \e[0mSolhint\n"
    else
        printf | "Dependency Solhint Missing. Solhint functions will fail."
      exit
    fi
}

#Manticore Check?
#Solhydra Check?
#Slither Check?

mythRun() {
  sed -i 's/pragma solidity ..*0*;/pragma solidity >=0\.4\.25;/g' $filteredVar
  printf "# Mythril Output\n" |& tee -a Audit_Tools_Report.md 
  
  for file in $filteredVar
do
  myth -x $file --solc-args='--allow-paths *$rootDir*' |& tee -a Audit_Tools_Report.md 
done
}

maruRun() {
  mkdir a3632
  cp $filteredVar ./a3632/
  printf "# Maru Output\n" |& tee -a Audit_Tools_Report.md 
  maru -r a3632 |& tee -a Audit_Tools_Report.md 
  sleep 0.2
  rm -rf a3632 
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
    grep -v cryptofin-solidity | \
    grep -v IERC20.sol 

}



fileList() {
  printf "\n ## File Lists\n\n" |& tee -a Audit_Tools_Report.md
  printf "$filteredVar" | xargs -L 1 basename | sort > file1
  filteredList=$(cat file1)
  printf "$unfilteredVar" | xargs -L 1 basename | sort > file2
  diffsList=$(awk 'FNR==NR {a[$0]++; next} !a[$0]' file1 file2)
  printf "<details> \n" |& tee -a Audit_Tools_Report.md
  printf "<summary>Recommended Files for Auditing</summary> \n" |& tee -a Audit_Tools_Report.md
  printf "\n \`\`\` \n" |& tee -a Audit_Tools_Report.md
  printf "$filteredList \n" |& tee -a Audit_Tools_Report.md
  printf "\n \`\`\` \n" |& tee -a Audit_Tools_Report.md
  printf "</details> \n" |& tee -a Audit_Tools_Report.md
  printf "<details> \n" |& tee -a Audit_Tools_Report.md
  printf "<summary>Recommended Files for Skipping</summary> \n" |& tee -a Audit_Tools_Report.md
  printf "\n \`\`\` \n" |& tee -a Audit_Tools_Report.md
  printf "$diffsList \n" |& tee -a Audit_Tools_Report.md
  printf "\n \`\`\` \n" |& tee -a Audit_Tools_Report.md
  printf "</details> \n" |& tee -a Audit_Tools_Report.md
  rm file1 file2

}

createFilteredVars() {
  filteredVar=$(filterFind)
  unfilteredVar=$(unfilterFind)
}

createReport() {
  printf "# Solscape Report\n" > Audit_Tools_Report.md
}

fileCount() {
  printf "\n\n## File Count \n" |& tee -a Audit_Tools_Report.md
    uF=$(unfilterFind | wc -l) 
    fF=$(filterFind | wc -l)
  printf "* **$uF** Solidity files exist in this contract system.\n" |& tee -a Audit_Tools_Report.md
  printf "* **$fF** of those files are recommended for auditing.\n" |& tee -a Audit_Tools_Report.md
}


lineCount() {
    printf "\n ## Line Count \n" |& tee -a Audit_Tools_Report.md
        uF2=$(unfilterFind | xargs wc -l | tail -1 | sed -e 's/total//g' | sed -e 's/^[[:space:]]*//'|sed 's/ //g')
        fF2=$(filterFind | xargs wc -l | tail -1 | sed -e 's/total//g' | sed -e 's/^[[:space:]]*//'|sed 's/ //g')
    printf "* **$uF2** Solidity lines exist in this contract system.\n" |& tee -a Audit_Tools_Report.md
    printf "* but, only **$fF2** of those need audited.\n" |& tee -a Audit_Tools_Report.md
}

suryaDescribe() {
    printf "<details> \n" |& tee -a Audit_Tools_Report.md
    printf "<summary>Description Report</summary> \n" |& tee -a Audit_Tools_Report.md
    printf "\n\n### Surya Describe \n" |& tee -a Audit_Tools_Report.md
    surya describe $filteredVar | sed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g" |& tee -a Audit_Tools_Report.md
    printf "</details> \n" |& tee -a Audit_Tools_Report.md
}

suryaParse(){
    printf "<details> \n" |& tee -a Audit_Tools_Report.md
    printf "<summary>Surya Parse Tree</summary> \n" |& tee -a Audit_Tools_Report.md
    printf "\n\n### Surya Parse \n \n \`\`\` \n" |& tee -a Audit_Tools_Report.md
    surya parse $filteredVar |& tee -a Audit_Tools_Report.md
    printf "\n \`\`\` \n" |& tee -a Audit_Tools_Report.md
    printf "</details> \n" |& tee -a Audit_Tools_Report.md
}

suryaInheritance() {
  printf "<details> \n" |& tee -a Audit_Tools_Report.md
  printf "<summary>Inheritance Graph</summary> \n\n" |& tee -a Audit_Tools_Report.md
  printf "\n ## Inheritance Graph\n\n" |& tee -a Audit_Tools_Report.md
  printf "**Surya's Inheritance Graph** creates an exhaustive visualization of parent and child contracts.\n" |& tee -a Audit_Tools_Report.md
  surya inheritance $filteredVar | dot -Tpng > InheritanceGraph.png
  printf "![Inheritance Graph](InheritanceGraph.png)\n\n" |& tee -a Audit_Tools_Report.md
  printf "</details> \n" |& tee -a Audit_Tools_Report.md
}

suryaMdReport() {
    printf "<details> \n" |& tee -a Audit_Tools_Report.md
    printf "<summary>Markdown Report</summary> \n\n" |& tee -a Audit_Tools_Report.md
    printf "## Markdown Report \n\n" |& tee -a Audit_Tools_Report.md 
    printf "**Surya's Markdown Report** gives an eagle-eye view of a smart contract system's inner workings. It displays:\n"  |& tee -a Audit_Tools_Report.md
    printf "* Files to be audited, along with their SHA-1 hash. \n" |& tee -a Audit_Tools_Report.md
    printf "* The directory of each file in the contract system. \n" |& tee -a Audit_Tools_Report.md
      surya mdreport MDReport.md $filteredVar
      cat MDReport.md |& tee -a Audit_Tools_Report.md
      rm MDReport.md
    printf "</details> \n" |& tee -a Audit_Tools_Report.md
}

suryaCall() {
  printf "<details> \n" |& tee -a Audit_Tools_Report.md
  printf "<summary>Call Graph</summary> \n\n" |& tee -a Audit_Tools_Report.md
  printf "## Call Graph \n\n" |& tee -a Audit_Tools_Report.md
  printf "**Surya's Call Graph** creates an exhaustive visualization of all function calls.\n" |& tee -a Audit_Tools_Report.md
  surya graph $filteredVar | dot -Tpng > CallGraph.png
  printf "![Call Graph](CallGraph.png) \n\n" |& tee -a Audit_Tools_Report.md
  printf "</details> \n" |& tee -a Audit_Tools_Report.md
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
createFilteredVars
lineCount
fileCount
fileList
printf "\n ## Surya Reports \n" >> Audit_Tools_Report.md
suryaDescribe
suryaParse
suryaMdReport
suryaInheritance
suryaCall
}

analyze() {
printf "# Analysis Report \n" >> Audit_Tools_Report.md
createFilteredVars
mythRun
maruRun
solhintRun
}

 
while getopts ":hcs:a:l:d" opt; do
  case $opt in
    h)
      printf "\e[1m Solscape v 0.1.5\e[0m\n"
      printf "\n"
      printf " \e[4mUsage\e[0m: \e[2m./Solscape.sh -[option] /path/to/contractsDir\e[0m\n\n"
      printf "\e[1m Option    Description\e[0m\n"
      printf "   -h     This help text. \n"
      printf "   -c     Scan environment dependencies. \n"
      printf "   -s     Run scoping.\n"
      printf "   -a     Run analysis.\n"
      printf "   -l     Run all.\n"
      exit
      ;;
    c)
      checkDeps
      exit
      ;;
    s)
      rm Audit_Tools_Report.md
      rootDir=$OPTARG
      createReport
      scope
      exit
      ;;
    a)
      rm Audit_Tools_Report.md
      rootDir=$OPTARG
      createReport
      analyze
      exit
      ;;
    l)
      rm Audit_Tools_Report.md
      rootDir=$OPTARG
      createReport
      scope
      analyze
      exit
      ;;
#    d)
#      rm Audit_Tools_Report.md
#      rootDir=$OPTARG
#      scope
#      analyze
#      exit
#      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

      printf "\e[1m Solscape v 0.1.5\e[0m\n"
      printf "\n"
      printf " \e[4mUsage\e[0m: \e[2m./Solscape.sh -[option] ../path/to/contracts\e[0m\n\n"
      printf "\e[1m Option    Description\e[0m\n"
      printf "   -h     This help text. \n"
      printf "   -c     Scan environment dependencies. \n"
      printf "   -s     Run scoping.\n"
      printf "   -a     Run analysis.\n"
      printf "   -l     Run all.\n"

