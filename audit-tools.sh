#! /bin/bash

	PS3='I want to: '
options=("1 Scope Code" "2 Analyze Code" "3 Exit" "4 Exit")
select opt in "${options[@]}"
do
    case $opt in
        "1 Scope Code")
            ./scoping.sh
            ;;
        "2 Analyze Code")
            ./analysis.sh
            ;;
        "3 All of the Above")
            ./scoping.sh
            ./analysis.sh
            ;;        
        "4 Exit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done