#!/usr/bin/env bash

notify-send "Getting list of available Wi-Fi networks..."
get_signal_bar() {
    local signal=$1
    if [ "$signal" -ge 80 ]; then
        echo "▂▄▆█"
    elif [ "$signal" -ge 60 ]; then
        echo "▂▄▆ "
    elif [ "$signal" -ge 40 ]; then
        echo "▂▄  "
    elif [ "$signal" -ge 20 ]; then
        echo "▂   "
    else
        echo "    "
    fi
}
# Get a list of available wifi connections and morph it into a nice-looking list
wifi_list=$(nmcli -f SSID,SECURITY,SIGNAL device wifi list | awk '
NR>1 {
    ssid=$1
    for (i=2; i<=NF-2; i++) ssid=ssid " " $i
    security=$(NF-1)
    signal=$(NF)
    printf "%-30s %-15s %3s\n", ssid, security, signal
}' | while read -r ssid sec sig; do
    bars=$(get_signal_bar "$sig")
    echo "$ssid | $sec | $bars"
done)



connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
	toggle="󰖪  Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
	toggle="󰖩  Enable Wi-Fi"
fi

# Get currently connected SSID
current_ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)

if [ -n "$current_ssid" ]; then
    connection_info="  Connected to: $current_ssid"
else
    connection_info="睊  Not connected"
fi


# Use rofi to select wifi network
chosen_network=$(echo -e "$connection_info\n$toggle\n$wifi_list" | uniq -u | rofi -dmenu -i -selected-row 1 -p "Wi-Fi SSID: " )

# Get name of connection
read -r chosen_id <<< "${chosen_network:3}"

if [ "$chosen_network" = "" ]; then
	exit
elif [ "$chosen_network" = "󰖩  Enable Wi-Fi" ]; then
	nmcli radio wifi on
elif [ "$chosen_network" = "󰖪  Disable Wi-Fi" ]; then
	nmcli radio wifi off
else
	# Message to show when connection is activated successfully
  	success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
	# Get saved connections
	saved_connections=$(nmcli -g NAME connection)
	if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
		nmcli connection up id "$chosen_id" | grep "successfully" && notify-send "Connection Established" "$success_message"
	else
		if [[ "$chosen_network" =~ "" ]]; then
			wifi_password=$(rofi -dmenu -p "Password: " )
		fi
		nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send "Connection Established" "$success_message"
    fi
fi
