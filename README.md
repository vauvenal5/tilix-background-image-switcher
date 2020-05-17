# tilix-background-image-switcher
Cron script for changing periodically the background image of tilix.

For set up have a look into the imageSwitch.sh-file. You need to change the image directory and session variable.

## Systemd Timer Support
If you want to use a systemd timer instead you can use the prepared service and timer files form the systemd directory.

You will have to adapt the path in der servie-file to point to your location of imageSwitch.sh and you have to specify the user for whom it will be executed.

Then copy the two files to the `/etc/systemd/system` directory and enable+start the timer.

The interval is set to 5min and can be adjusted in the timer-file.