#! /bin/bash

printf() { builtin printf "$*"; sleep 0.$RANDOM; }

		
shopt -s globstar 


dialogCheck() {
    if command -v dialog --help>/dev/null; then
      cnt=1 
        printf | dialog --gauge "Dependency dialog passed." 10 70 $cnt
    else
        printf "Dependency dialog not passed. Install dialog to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
      exit
    fi
}

suryaCheck() {
    if command -v surya --help>/dev/null; then
        printf | dialog --gauge "Dependency surya passed." 10 70 3
    else
        printf "Dependency Surya not passed. Install Surya to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
      
      exit
    fi
}

graphvizCheck() {
    if command -v dot --help>/dev/null; then
        printf | dialog --gauge "Dependency graphviz passed." 10 70 7
    else
        printf | dialog --colors --title "ERROR" \
                      --yesno "\ZbGraphviz\Zn was not found on this system. Scoping requires \Zbgraphviz\Zn to run. View installation instructions?" 10 70
                      response=$?
                      case $response in
                      0) var=$(sed -n '/graphviz/p' README.md) && dialog --msgbox "$var" 10 70 && exec "$ScriptLoc";;
                      1) exec "$ScriptLoc" ;;
                      255) printf "Shutting down..." && sleep 0.5 ;;
esac
      exit
    fi
}

solcCheck() {
    if command -v dot --help>/dev/null; then
        printf | dialog --gauge "Dependency solc passed." 10 70 10
    else
        printf | dialog --colors --title "ERROR" \
                      --yesno "\Zbsolc\Zn not found. Analysis requires \Zbsolc\Zn to run. View README?" 10 70
                      response=$?
                      case $response in
                      0) var=$(sed -n '/solc/p' README.md) && dialog --msgbox "$var" 10 70 && exec "$ScriptLoc";;
                      1) exec "$ScriptLoc" ;;
                      255) printf "Shutting down..." && sleep 0.5 ;;
esac
      exit
    fi
}

mythCheck() {
    if command -v dot --help>/dev/null; then
        printf | dialog --gauge "Dependency Mythril passed." 10 70 11
    else
        printf | dialog --colors --title "ERROR" \
                      --yesno "\ZbMythril\Zn was not found on this system. Analysis requires \ZbMythril\Zn to run. View README?" 10 70
                      response=$?
                      case $response in
                      0) var=$(sed -n '/mythril/p' README.md) && dialog --msgbox "$var" 10 70 && exec "$ScriptLoc";;
                      1) exec "$ScriptLoc" ;;
                      255) printf "Shutting down..." && sleep 0.5 ;;
esac
      exit
    fi
}


maruCheck() {
    if command -v dot --help>/dev/null; then
        printf | dialog --gauge "Dependency Maru passed." 10 70 13
    else
        printf | dialog --colors --title "ERROR" \
                      --yesno "\ZbMaru\Zn was not found on this system. Analysis requires \ZbMaru\Zn to run. View README?" 10 70
                      response=$?
                      case $response in
                      0) var=$(sed -n '/maru/p' README.md) && dialog --msgbox "$var" 10 70 && exec "$ScriptLoc";;
                      1) exec "$ScriptLoc" ;;
                      255) printf "Shutting down..." && sleep 0.5 ;;
esac
      exit
    fi
}

solhintCheck() {
    if command -v dot --help>/dev/null; then
        printf | dialog --gauge "Dependency solhint passed." 10 70 15
    else
        printf | dialog --colors --title "ERROR" \
                      --yesno "\Zbsolhint\Zn not found. Analysis requires \Zbsolhint\Zn to run. View README?" 10 70
                      response=$?
                      case $response in
                      0) var=$(sed -n '/solhint/p' README.md) && dialog --msgbox "$var" 10 70 && exec "$ScriptLoc";;
                      1) exec "$ScriptLoc" ;;
                      255) printf "Shutting down..." && sleep 0.5 ;;
esac
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


getDir() {
    rootDir=$(dialog --title "Root Contract Directory" --stdout --title "Select the root contract directory and press spacebar then enter." --dselect ~/ 10 70)       
}

createScopingReport() {
printf "# Scoping Report \n" > ScopingReport.md   
}

createAnalysisReport() {
printf "# Analysis Report \n" > AnalysisReport.md   
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
  printf "## File Count \n" |& tee -a ScopingReport.md
    uF=$(unfilterFind | wc -l) 
    fF=$(filterFind | wc -l)
  printf "* **$uF** Solidity files exist in this contract system.\n" |& tee -a ScopingReport.md
  printf "* but, only **$fF** of those need audited.\n" |& tee -a ScopingReport.md

}


lineCount() {
    printf "## Line Count \n" |& tee -a ScopingReport.md
        uF2=$(unfilterFind | xargs wc -l | tail -1 | sed -e 's/total//g' | sed -e 's/^[[:space:]]*//'|sed 's/ //g')
        fF2=$(filterFind | xargs wc -l | tail -1 | sed -e 's/total//g' | sed -e 's/^[[:space:]]*//'|sed 's/ //g')
    printf "* **$uF2** Solidity lines exist in this contract system.\n" |& tee -a ScopingReport.md
    printf "* but, only **$fF2** of those need audited.\n" |& tee -a ScopingReport.md
}

suryaDescribe() {
    printf "### Surya Describe\n" |& tee -a ScopingReport.md
    surya describe $filteredVar | sed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g" |& tee -a ScopingReport.md
}

suryaParse(){
    printf "### Surya Parse\n" |& tee -a ScopingReport.md
    surya parse $filteredVar |& tee -a ScopingReport.md
}

suryaInheritance() {
  printf "## Inheritance Graph\n" |& tee -a ScopingReport.md
  printf "**Surya's Inheritance Graph** creates an exhaustive visualization of all function calls.\n" |& tee -a ScopingReport.md
  surya inheritance $filteredVar | dot -Tpng > InheritanceGraph.png
  printf "![Inheritance Graph](InheritanceGraph.png)"\n |& tee -a ScopingReport.md
}

suryaMdReport() {
    printf "## Markdown Report\n" |& tee -a ScopingReport.md 
    printf "**Surya's Markdown Report** gives an eagle-eye view of a smart contract system's inner workings. It displays:\n"  |& tee -a ScopingReport.md
    printf "* Files to be audited, along with their SHA-1 hash. \n" |& tee -a ScopingReport.md
    printf "* The directory of each file in the contract system. \n" |& tee -a ScopingReport.md
    printf "* The description table of all contracts (surya describe.) \n" |& tee -a ScopingReport.md
    printf "* Click (here)[MDReport.md] to view Surya's Markdown Report. \n" |& tee -a ScopingReport.md
      surya mdreport MDReport.md $filteredVar && cat MDReport.md |& tee -a ScopingReport.md
}

suryaCall() {
  printf "## Call Graph\n" |& tee -a ScopingReport.md
  printf "**Surya's Call Graph** creates an exhaustive visualization of all function calls.\n" |& tee -a ScopingReport.md
  surya graph $filteredVar | dot -Tpng > CallGraph.png
  printf "![Call Graph](CallGraph.png)"\n |& tee -a ScopingReport.md
}

#progressBar() {
#   dialog --begin 2 65 --keep-window --gauge "Variables Filtered." 7 50 6
# }


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

CHOICE=$(dialog --colors --aspect 0 --begin 3 65 --title "Audit Tools 0.1.0" --infobox  "$INTRO" 5 55 \
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
          printf | dialog --gauge "Directory Acquired." 10 70 20
        createFilteredVars
          printf | dialog --gauge "Variables Filtered." 10 70 36
        createScopingReport
          printf | dialog --gauge "Report Created." 10 70 42
        fileCount
          printf | dialog --gauge "Files Counted." 10 70 48
        lineCount
          printf | dialog --gauge "Lines Counted." 10 70 54
        suryaDescribe
          printf | dialog --gauge "Contracts Described." 10 70 60
        suryaInheritance
          printf | dialog --gauge "Inheritance Pictured." 10 70 72
        suryaCall
          printf | dialog --gauge "Calls Graphed." 10 70 84
        suryaParse
          printf | dialog --gauge "Parse Tree Generated." 10 70 96 
        suryaMdReport
          printf | dialog --gauge "MDReport Generated." 10 70 100
        sleep 1.25
        exec "$ScriptLoc"
            ;;
        2)
          solcCheck
          mythCheck
          maruCheck
          solhintCheck
          getDir
            printf | dialog --gauge "Directory Acquired." 10 70 25
          createFilteredVars 
            printf | dialog --begin --gauge "Variables Filtered." 10 70 40
          mythRun | dialog --progressbox Feed 25 65 
            printf | dialog --gauge "Mythril Analysis Complete." 10 70 70
          maruRun #|  dialog --progressbox  Feed 25 65
            printf | dialog --gauge "Maru Analysis Complete." 10 70 90
          solhintRun #| dialog --stdout --progressbox Feed 25 65 
            printf | dialog --gauge "Solhint Analysis Complete." 10 70 100
          sleep 1.25
          exec "$ScriptLoc"
            ;;
        3)
          dialogCheck
          suryaCheck
          graphvizCheck
          solcCheck
          mythCheck
          maruCheck
          solhintCheck
          getDir
            printf | dialog --gauge "Directory Acquired." 10 70 20
          createFilteredVars
            printf | dialog --gauge "Variables Filtered." 10 70 33
          createScopingReport
            printf | dialog --gauge "Report Created." 10 70 39
          fileCount |  
            printf | dialog --gauge "Files Counted." 10 70 43
          lineCount |  
            printf | dialog --gauge "Lines Counted." 10 70 46
          suryaDescribe 
            printf | dialog --gauge "Contracts Described." 10 70 47
          suryaInheritance | dialog --progressbox  Feed 25 65
            printf | dialog --gauge "Inheritance Pictured." 10 70 50
          suryaCall 
            printf | dialog --gauge "Calls Graphed." 10 70 53
          suryaParse | dialog --progressbox  Feed 25 65
            printf | dialog --gauge "Parse Tree Generated." 10 70 56
          suryaMdReport | dialog --progressbox  Feed 25 65
            printf | dialog --gauge "MDReport Generated." 10 70 58
          createFilteredVars | dialog --progressbox  Feed 25 65
            printf | dialog --gauge "Variables Filtered." 10 70 59
          mythRun | dialog --progressbox  Feed 25 65
            printf | dialog --gauge "Mythril Analysis Complete." 10 70 75
          maruRun #|  dialog --progressbox  Feed 25 65
            printf | dialog --gauge "Maru Analysis Complete." 10 70 90
          solhintRun #| dialog --stdout --progressbox Feed 25 65 
            printf | dialog --gauge "Solhint Analysis Complete." 10 70 100
          sleep 1.25
        exec "$ScriptLoc"
            ;;
        4) 
            exit
            ;;
esac
