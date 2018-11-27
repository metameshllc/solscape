#!/bin/bash

dialog --backtitle "Multiple dialog widgets" --begin 4 4 --title msgbox1 --msgbox First 0 0 \
              --and-widget --begin 10 10 --title msgbox2 --msgbox Second 0 0 \
              --and-widget --begin 16 16 --title msgbox3 --msgbox Third 0 0 \
              --and-widget --begin 20 40 --title infobox1 --infobox "There are multiple widgets." 0 0 \
              --and-widget --begin 30 35 --tile infobox2 --infobox "I'm here too." 0 0
