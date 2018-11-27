echo percentage | dialog --gauge "text" height width percent
sleep 1
echo "10" | dialog --gauge "Please wait" 10 70 0
sleep 4
echo "50" | dialog --gauge "Please wait" 10 70 0
sleep 5
echo "100" | dialog --gauge "Please wait" 10 70 0
