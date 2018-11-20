#!/bin/bash

	PS3='I want to: '
options=("1 Scope Code" "2 Analyze Code" "3 Exit" "4")
select opt in "${options[@]}"
do
    case $opt in
        "1 Scope Code")



            ;;
        "2 Analyze Code")
            echo "you chose choice 2"
            ;;
        "3 Exit")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "4")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done