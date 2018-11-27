#! /bin/bash

echo() { builtin echo "$*"; sleep 0.5$RANDOM; }

#THIS SETS THE VARIABLES TO BOLD TEXT
bold=$(tput bold)
normal=$(tput sgr0)
currentDate=`date`
		
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


NUMBER=2
graffViz
NUMBER=3
diallog
NUMBER=4


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
        1)NUMBER=0
            dialog --begin 25 20 --gauge Progress 7 15 $NUMBER
          NUMBER=1
          surryaa
            dialog --begin 25 20 --gauge Progress 7 15 $NUMBER
          NUMBER=2
          graffViz
            dialog --begin 25 20 --gauge Progress 7 15 $NUMBER
          NUMBER=3
                      


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




