#! /bin/bash

echo() { builtin echo "$*"; sleep 0.$RANDOM; }

#THIS SETS THE VARIABLES TO BOLD TEXT
bold=$(tput bold)
normal=$(tput sgr0)
currentDate=`date`
		
shopt -s globstar 

surryaa() {
    if command -v surya --help>/dev/null; then
        echo "6" | dialog --gauge "Dependency surya passed." 10 70 0

    else
        echo "Dependency Surya not passed. Install Surya to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
      
      exit
    fi
}


graffViz() {
    if command -v dot --help>/dev/null; then
        echo "9" | dialog --gauge "Dependency graphviz passed." 10 70 0
    else
        echo | dialog --colors --title "ERROR" \
                      --yesno "\ZbGraphviz\Zn was not found on this system. Scoping requires \Zbgraphviz\Zn to run. Instructions for installing, \Zbgraphviz\Zn can be found in the README. Would you like to view the README?" 10 70
                      response=$?
                      case $response in
                      0) echo | dialog  --textbox ./README.md 70 100;;
                      1) echo "File not deleted.";;
                      255) echo "[ESC] key pressed.";;
esac
      exit
    fi
}
 

diallog() {
    if command -v dialog --help>/dev/null; then
        echo "3" | dialog --gauge "Dependency dialog passed." 10 70 0

    else
        echo "Dependency dialog not passed. Install dialog to continue. For help installing, read the ${bold}Dependencies${normal} section in the README." 
      exit
    fi
}







HEIGHT=15
WIDTH=45
CHOICE_HEIGHT=4
BACKTITLE="Audit Tools"
TITLE="Main Menu"
MENU="What would you like to do?"
INTRO="\ZbAudit Tools\Zn, an interactive script for automating pre-assessment and testing phases of security audits on Solidity code bases."


OPTIONS=(1 "Scope Code"
         2 "Analyze Code"
         3 "About"
         4 "Exit")

CHOICE=$(dialog --colors --aspect 75 --begin 3 37 --title Intro --infobox  "$INTRO" 0 0 \
  --and-widget --clear --backtitle "$BACKTITLE" --title "$TITLE" --menu "$MENU" $HEIGHT $WIDTH $CHOICE_HEIGHT "${OPTIONS[@]}" 2>&1 >/dev/tty)

case $CHOICE in
        1)
        diallog
        surryaa
        graffViz
        

        echo "9" | dialog --gauge "Please wait" 10 70 0

                      


            ;;
        2)
            echo "You chose Option 2"
            ;;
        3)
            echo ""
            ;;
        4) 
            exit
            ;;
esac




