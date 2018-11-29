#! /bin/bash

printf() { builtin printf "$*"; sleep 0.0$RANDOM; }

		
shopt -s globstar 
 

diallog() {
    if command -v dialog --help>/dev/null; then
        printf | dialog --gauge "Dependency dialog passed." 10 70 3
    else
        printf "Dependency dialog not passed. Install dialog to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
      exit
    fi
}

surryaa() {
    if command -v surya --help>/dev/null; then
        printf | dialog --gauge "Dependency surya passed." 10 70 6
    else
        printf "Dependency Surya not passed. Install Surya to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
      
      exit
    fi
}


graffViz() {
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


fileCount() {
        printf "## File Count \n" >> ScopingReport.md
            uF=$(unfilterFind | wc -l) 
            fF=$(filterFind | wc -l)
        printf "* **$uF** Solidity files exist in this contract system.\n" >> ScopingReport.md
        printf "* **$fF** of those are recommended for auditing.\n" >> ScopingReport.md
        printf "* To view all filenames, see Appendix A.\n" >> ScopingReport.md
        printf | dialog --gauge "File count summed and written to ScopingReport.md" 10 70 18

}


lineCount() {
    printf "## Line Count \n" >> ScopingReport.md
        uF2=$(unfilterFind | xargs wc -l | tail -1 | sed -e 's/total//g' | sed -e 's/^[[:space:]]*//')
        fF2=$(filterFind | xargs wc -l | tail -1 | sed -e 's/total//g' | sed -e 's/^[[:space:]]*//')
    printf "* **$uF2** Solidity lines exist in this contract system.\n" >> ScopingReport.md
    printf "* **$fF2** of those are recommended for auditing.\n" >> ScopingReport.md
    printf "* To view all code lines, see Appendix B.\n" >> ScopingReport.md
    printf | dialog --gauge "Line count summed and written to ScopingReport.md" 10 70 21
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
--and-widget --clear --backtitle "$BACKTITLE" --title "$TITLE" --menu "$MENU" $HEIGHT $WIDTH $CHOICE_HEIGHT "${OPTIONS[@]}" 2>&1 >/dev/tty)


case $CHOICE in
        1)
        diallog
        surryaa
        graffViz
        getDir
        createReport
        fileCount
        lineCount

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
