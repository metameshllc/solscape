#! /bin/bash

printf() { builtin printf "$*"; sleep 0.1$RANDOM; }

		
shopt -s globstar 
 

dialogCheck() {
    if command -v dialog --help>/dev/null; then
        printf | dialog --gauge "Dependency dialog passed." 10 70 3
    else
        printf "Dependency dialog not passed. Install dialog to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
      exit
    fi
}

suryaCheck() {
    if command -v surya --help>/dev/null; then
        printf | dialog --gauge "Dependency surya passed." 10 70 6
    else
        printf "Dependency Surya not passed. Install Surya to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
      
      exit
    fi
}

graphvizCheck() {
    if command -v dot --help>/dev/null; then
        printf | dialog --gauge "Dependency graphviz passed." 10 70 9
    else
        printf | dialog --colors --title "ERROR" \
                      --yesno "\ZbGraphviz\Zn was not found on this system. Scoping requires \Zbgraphviz\Zn to run. Instructions for installing, \Zbgraphviz\Zn can be found in the README. Would you like to view this section of the README?" 10 70
                      response=$?
                      case $response in
                      0) var=$(sed -n '/graphviz/p' README.md) && dialog --msgbox "$var" 10 70 && ./audit-tools.sh;;
                      1) ./audit-tools.sh ;;
                      255) printf "Shutting down..." && sleep 0.5 ;;
esac
      exit
    fi
}


getDir() {
    rootDir=$(dialog --title "Root Contract Directory" --stdout --title "Select the root contract directory and press spacebar then enter." --dselect ~/ 10 70)       
        printf | dialog --gauge "Root directory acquired." 10 70 12
}

createReport() {
printf "# Scoping Report \n" > ScopingReport.md   
        printf | dialog --gauge "Scoping report file created." 10 70 15

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
    grep -v openzeppelin-solidity
}

createFilteredVars() {
  suryaFilter=$(filterFind)
  suryaUnFilter=$(unfilterFind)
}


fileCount() {
  printf "## File Count \n" >> ScopingReport.md
    uF=$(unfilterFind | wc -l) 
    fF=$(filterFind | wc -l)
  printf "* **$uF** Solidity files exist in this contract system.\n" >> ScopingReport.md
  printf "* but, only **$fF** of those need audited.\n" >> ScopingReport.md
  printf | dialog --gauge "File count summed and written to ScopingReport.md" 10 70 18

}


lineCount() {
    printf "## Line Count \n" >> ScopingReport.md
        uF2=$(unfilterFind | xargs wc -l | tail -1 | sed -e 's/total//g' | sed -e 's/^[[:space:]]*//')
        fF2=$(filterFind | xargs wc -l | tail -1 | sed -e 's/total//g' | sed -e 's/^[[:space:]]*//')
    printf "* **$uF2** Solidity lines exist in this contract system.\n" >> ScopingReport.md
    printf "* but, only **$fF2** of those need audited.\n" >> ScopingReport.md
    printf | dialog --gauge "Line count summed and written to ScopingReport.md" 10 70 21
}


suryaMdReport() {
    printf "## Markdown Report\n" >> ScopingReport.md 
    printf "**Surya's Markdown Report** gives an eagle-eye view of a smart contract system's inner workings. It displays:\n"  >> ScopingReport.md
    printf "* Files to be audited, along with their SHA-1 hash. \n" >> ScopingReport.md
    printf "* The directory of each file in the contract system. \n" >> ScopingReport.md
    printf "* The description table of all contracts (surya describe.) \n" >> ScopingReport.md
    printf "* Click (here)[MDReport.md] to view Surya's Markdown Report. \n" >> ScopingReport.md
      surya mdreport MDReport.md $suryaFilter 
    printf | dialog --gauge "Markdown Report written." 10 70 27
}

suryaCall() {
  printf "## Call Graph\n" >> ScopingReport.md
  printf "**Surya's Call Graph** creates an exhaustive visualization of all function calls." >> ScopingReport.md
  surya graph $suryaFilter  | dot -Tpng CallGraph.png
  printf "![Call Graph](CallGraph.png)"
}

suryaInheritance() {
  printf "## Inheritance Graph\n" >> ScopingReport.md
  printf "**Surya's Inheritance Graph** creates an exhaustive visualization of all function calls." >> ScopingReport.md
  surya inheritance $suryaFilter  | dot -Tpng InheritanceGraph.png
  printf "![Inheritance Graph](InheritanceGraph.png)"
}

createAppendix() {
  printf "# Appendices\n" >> ScopingReport.md
  printf | dialog --gauge "Appendix written." 10 70 33
}


suryaDescribe() {
    printf "## Appendix A: Surya\n" >> ScopingReport.md
    printf "### Surya Describe\n" >> ScopingReport.md
    surya describe $suryaFilter #| sed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g" >> ScopingReport.md
    printf | dialog --gauge "Description Report Written" 10 70 36
}

suryaParse(){
    printf "### Surya Parse\n" >> ScopingReport.md
    surya parse $suryaFilter >> ScopingReport.md
    printf | dialog --gauge "Parse Report Written" 10 70 39
}


HEIGHT=15
WIDTH=45
CHOICE_HEIGHT=4
BACKTITLE="Audit Tools"
TITLE="Main Menu"
MENU="What would you like to do?"
INTRO="An interactive script for automating pre-assessment and testing phases of security audits on Solidity code bases."


OPTIONS=(1 "Scope Code"
         2 "Analyze Code"
         3 "Run All"
         4 "Exit")

CHOICE=$(dialog --colors --aspect 0 --begin 3 65 --title "Audit Tools" --infobox  "$INTRO" 5 55 \
  --and-widget --colors --begin 3 2 --title "Environment" --infobox \
"\Z1Shell directory:\Zn \Zb$BASH$\Zn 
\Z1Shell version:\Zn \Zb$BASH_VERSION$\Zn 
\Z1Working directory:\Zn \Zb$PWD$\Zn" 5 55 \
--and-widget --backtitle "$BACKTITLE" --title "$TITLE" --menu "$MENU" $HEIGHT $WIDTH $CHOICE_HEIGHT "${OPTIONS[@]}" 2>&1 >/dev/tty)


case $CHOICE in
        1)
        dialogCheck
        suryaCheck
        graphvizCheck
        getDir
        createFilteredVars
        createReport
        fileCount
        lineCount
        suryaDescribe
        suryaInheritance
        suryaCall
        suryaParse
        suryaMdReport
        createAppendix
        

            ;;
        2)
            printf "You chose Option 2"
            sleep 2
            ./audit-tools.sh
            ;;
        3)
            printf ""
            ;;
        4) 
            exit
            ;;
esac
