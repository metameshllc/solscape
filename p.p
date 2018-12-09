dialog \
                  --begin 7 15 --gauge "Variables Filtered" 1 20 30 \
    --and-widget --keep-window --begin 25 23 --progressbox "Feed" 25 65 \
    --and-widget               --begin 19 43 --yesno "" 0 0

    printf | dialog --begin 15 2 --gauge "Variables Filtered." 6 50 40 
 --and-widget  --progressbox Feed 25 70 