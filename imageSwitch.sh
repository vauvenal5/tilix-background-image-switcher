#!/bin/sh

# location of the folder with your background pictures
imagePath="$HOME/.tilixBackgrounds"

# Cron DBUS discovery block
# when used with cron or as global systemd service instead of user service, the following is needed to find the dbus of the current user
# change this to point to your specific UI session
# uiSession="gnome-session-b" # gnome
# uiSession="plasma_session" # plasma
# enable the following lines to find and export the DBUS address
# PID=$(pgrep "$uiSession")
# export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ | tr '\0' '\n' | cut -d= -f2-)
# finally if used with cron do not forget to set up the cron job ;)

# start of the actual script
pics=("$imagePath"/*)
key="/com/gexperts/Tilix/background-image"
selected=$(dconf read $key)
echo "old: $selected"

for ((i=0; i<${#pics[@]}; i++)); do
	if [ "'${pics[$i]}'" = "$selected" ]
  then
    file="${pics[0]}"

    if (($i+1<${#pics[@]}))
    then
      file="${pics[$i+1]}"
    fi

    echo "new: '$file'"
    dconf write $key "'$file'"
    break
	fi
done
