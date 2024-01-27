# Dual display setup
## Set up boot screen
First of all to set the laptop screen as primary on boot add this:

    xrandr --output <laptop monitor name> --auto --output <secondary monitor name> --right-of <laptop monitor name> --auto

to whatever file from `/usr/share/lightdm/lightdm.conf.d/` holds other `xrandr` commands

Or, the old way, add 

    display-setup-script=xrandr --output <laptop monitor name> --auto --output <secondary monitor name> --right-of <laptop monitor name> --auto

to `/etc/lightdm/lightdm.conf` if this file exists.

## Set up profiles
Go to `Display` and set up two profile. One with laptop monitor as primary, and xfce4-panel needs to be set up to be shown on `Primary` monitor. The other profile should have vice-versa settings, but laptop display should be switched off.

After that you can chech `xfce4-settings` for `displays`. There will be both profiles but instead of their names - there would be there ids. To switch between profiles you should run this script:

    xfconf-query --create --type string -c displays -p /Schemes/Apply -s <profile-id>