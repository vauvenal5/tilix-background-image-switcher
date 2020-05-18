# tilix-background-image-switcher
Script for changing periodically the background image of tilix.

In the script you can change the path to your images by changing the `imagePath` variable.

## Systemd Timer Support
If you want to use a systemd timer you can use the prepared service and timer files from the systemd folder. This is prefered to cron because you can run the service in the context of the current user and do not have to search for the current DBUS address.

You will have to adapt the path in the service-file to point to your location of `imageSwitch.sh`.

Then copy the service- and timer-file to `~/.config/systemd/user` and enable+start the timer as a user service. To start and enable as a user service run the following commands (no root required):
```bash
systemctl --user start imageSwitch.timer
systemctl --user enable imageSwitch.timer
```

The interval is set to 5min and can be adjusted in the timer-file.

### Global Systemd Service
Not recommended since this service is made to switch the background image of a specific user. If you still prefer a global setup, you will have to enable the DBUS address discovery block as for a cron setup and also add a `USER` or `GROUP` to the service file. Please refer to the systemd documentation for more information.

## Cron Task
To use it as a cron task uncomment the block which searches for the DBUS address at the beginning of the script and set the `uiSession` variable to point to your ui session. Afterwards set up a cron task as needed.