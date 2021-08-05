# Create a directory:

    mkdir <dir name>

# Memory usage:

    free -mh
    top
    htop 

# Check system:

    sudo dmidecode --type memory

# PHP

    php -v
    cd to directory where files are
    php -S localhost:9000

# Search folder and subfolders for some_text in files

    grep -rw . -e 'some_text'

# Zip to archive files

    zip name_of_archive * 
    add -e for password protection

# Gzip GZ

    gzip -dr ~/file.gz
    gzip -c filename > filename.gz or gzip -k filename
    gzip -r directory

# RDBMS or services in general
## (mssql-server, postgresql.service, mongod)

    sudo systemctl stop service-name
    sudo systemctl disable service-name
    sudo systemctl enable service-name
    sudo systemctl start service-name
    sudo systemctl restart service-name
    sudo systemctl status service-name
    
    sudo /etc/init.d/service-name restart

## To find out all services that have been run at startup:

    systemctl list-units --type service
    systemctl is-active service-name

## Show list of dependencies:

    systemctl list-dependencies --before timers.target
    systemctl list-dependencies --after timers.target

## read journal info (last 30 entries)

    journalctl -u mssql-server | tail -30

# Edit files:

    sudo nano Directory/file

# Basic copy:

    sudo cp Directory/file /Destination/Directory/

# Find files/folders:

    udo locate what-to-search

# IP and network:

    ifconfig

## Check open ports and services:

    netstat -na
    netstat -nlp

# Show data from file:

    cat /path/to/file

## show last rows from file:

    tail /path/to/file

## show with scrolling:

    less /path/to/file

# working with locale:

    locale -a
    sudo locale-gen "en_US.UTF-8"
    sudo dpkg-reconfigure locales
    sudo nano /etc/default/locale

## Set weekday (or other parameter)

    sudo nano /usr/share/i18n/locales/en_US

change in `LC_TIME` `first_weekday 1` to `first_weekday 2`

    sudo locale-gen

# Install/unpack deb package:

    sudo apt install ./path/to/file.deb
    sudo dpkg -i ./path/to/file.deb
    sudo dpkg -i ./path/to/file.deb --auto-deconfigure
    sudo apt --fix-broken install

list all
    
    dpkg -l

show info

    dpkg -f ./path/to/file.deb

delete

    sudo dpkg -P package-name
    sudo dpkg -r package-name

# clean/update/upgrade:

    sudo apt-get clean && sudo apt-get update && sudo apt-get upgrade
    sudo apt autoremove
    sudo apt-get autoclean
    sudo apt --fix-broken install

# ppa repositories

## with apt

    sudo apt-add-repository ppa:<ppa to add>
    sudo add-apt-repository -r ppa:<ppa to remove>
    
## Manually

Check files here:

    /etc/apt/sources.list.d/

And this file:

    /etc/apt/sources.list

Then:

    sudo apt update

# Upgrade/update ubuntu version:

check new version availability

    do-release-upgrade -c 

perform upgrade

    sudo do-release-upgrade 

check what type of distribution you have/want lts|normal etc

    sudo nano /etc/update-manager/release-upgrades

# update private keys:

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys HASHOFTHEKEY

# turn-off computer:

    upower -d
    shutdown

# Remove software:

    sudo apt purge software
    sudo apt-get purge software
    sudo apt remove software

# Check linux version and hardware:

kernel

    uname -a

memory

    free -mh

Distro

    cat /etc/*-release 
    lsb_release -a 
    cat /etc/issue

processor

    cat /proc/cpuinfo
    
ip address & ethernet adapters

    ip a
    
all info

    lshw

# Check video:

    glxinfo|egrep "OpenGL vendor|OpenGL renderer"

# To change machine name:

    sudo nano /etc/hosts
    sudo nano /etc/hostname

# To make ls command always use colors:

    alias "ls=ls --color=auto"

Also alias command can be used in another ways

# Current directory

    pwd

# Add some text to every string in one file and write it to another one:

    awk '{print "Random text "$0}' foo.txt >> foo1.txt

# Python:

at first download from off-site

    tar xf python-X.X.X.tar.xz

go to catalog

    sudo ./configure --enable-optimization 
    sudo ./configure --prefix=/usr --sysconfdir=/etc

to overwright current default

    sudo make install

to install one more instance

    sudo make altinstall 

## to install pygame you need some dependencies:

    sudo apt install libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsdl1.2-dev libsmpeg-dev python-numpy subversion libportmidi-dev ffmpeg libswscale-dev libavformat-dev libavcodec-dev
    sudo pip3 install pygame
    sudo pip3 install superwires

# To change image size right in terminal:

    sudo apt-get install imagemagick

## keep image aspect ratio

    mogrify -resize 50% file-name

## keep image aspect ratio

    mogrify -resize 320x240 file-name

## don't keep image aspect ratio 

    mogrify -resize 320x240! file-name

## don't keep image aspect ratio

    mogrify -resize x240 file-name

## don't keep image aspect ratio

    mogrify -resize 320x file-name

## crop file

    mogrify -crop 1920x1080 file-name

if the file is big it will cut 1920x1080 ain one file and put other stuff in second file.

# To get file info

    identify file
    identify file.png | awk '{print $1,$2}'

# Search for commands:

    apropos .
    apropos files
    apropos "remove files"

# Search for description of particular command:

    whatis rm

# Show man-page

    man <command>

## Navigation:

f b up down  
/SearchString  

## Spec section number:

man 7 man goes to 7 section of man manual

# Shows the path where command is located:

    which <command>

# Directory structure:

    ls -lah /dir

The first letter represents:  

`-` file  
`d` directory  
`c` charecter (tty)  
`b` block (some device)  
`l` link  
`p` pipes  
`s` socket (p and s used for process to communicate w/ each other  

# Shows type of file:

    file <filename>

# Shows detailed info about file:

    stat <filename>

# Super user:
## starts sudo session w/o password prompt every few minutes

    sudo -s 

## stop sudo session

    sudo -k 
    exit

# Grep examples:

    grep "Trick" tricks.py --colour=always -n

`i` - case insensitive  
`v` - invert-match  
`n` - row numbers  
`E` - regexp  

# Working with csv (or text):

    awk -F ';' '{print $1 '\t' $3}' sample.csv | sort -t

will remove duplicated

    sort -u file.ext

# Archive:

    tar caf name.tar.gz what_to_archive

`c` - create  
`a` - use extension to get what version of algorithm use  

    tar xf what_was_archived -C where_to unpack

`x` - extract  
`f` - use file, else stdout will be used  

## Unzip/untar all files in current directory

    for a in $(ls -1 star.tar.bz2); do tar -xf $a; done

## The general syntax of tar utility for extracting files:

    tar -xf file_name.tar -C /target/directory
    tar -xf file_name.tar.gz --directory /target/directory
    unzip <path to zip file> -d <dest directory>

# Disk usage:

disk space used on a mount level

    df -h

disk usage (human readable, only first level of objects) sorted 

    du / -h -d 1 | sort -h  

# Rename files in directory (replace _ with _)

    for a in $(ls -1 .); do mv $a ${a//_/-}; done
    for f in *\ *; do mv "$f" "${f// /-}"; done

uppercase to lowercase

    for f in *.*; do mv "$f" "${f,,}"; done

# Use sed to replace charecters in the string (replaces xy with 1)

    string="abcxyabcxyabc"
    echo "$string" | sed -r 's/[xy]+/1/g'

# Create file (fast):

    touch <filename>

# Update locate cache:

    sudo updatedb

# Anaconda:

list of all packages

    conda list

list of environments

    conda info --envs

activate/deactivate env

    conda activate <myenv-name>
    conda deactivate

update all packages in the current environment to the latest version

    conda update --all

# jupyter

    jupyter notebook stop
    jupyter notebook
    jupyter notebook list

# List usb devices:

    lsusb

# Add user to group:

add user to some group

    usermod -a -G examplegroup exampleusername

list of all groups

    getent group

# VirtualBox:

    sudo dpkg -i virtualbox-6.1_6.1.22-144080~Ubuntu~eoan_amd64.deb
    sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-6.1.22.vbox-extpack

# SQL Server features install:

SSIS

    sudo apt-get install mssql-server-is

Full-Text Search

    sudo apt-get install mssql-server-fts

(Server Agent) in 2017

    sudo apt-get install mssql-server-agent 

in 2019

    sudo /opt/mssql/bin/mssql-conf set sqlagent.enabled true 

# Docker:

check state

    systemctl show --property ActiveState docker
    systemctl show --property ActiveState containerd

    sudo systemctl status docker
    sudo systemctl status containerd

check available containers

    sudo docker ps -a

start/stop containers

    docker start/stop imagename

run a command in a new container

    docker run imagename

to enter a container through terminal

    docker exec -it imagename bash

list of data volumes

    docker volume ls

    docker run -e'ACCEPT_EULA=Y' -e'MSSQL_SA_PASSWORD=Password' --name sqlserverN -d microsoft/mssql-server-linux:2019-latest -v datavolumename:/path/to/dbs

remove image

    docker rm imagename

other 

    sudo docker container ls
    sudo docker images
    sudo docker rm -f 6435c446a2a3bb8416d88959c7d47b5c5f56ef1b9a98d83452fc85f2328bb6bb 
    sudo docker run -it -v mongodata:/data/db -p 27019:27017 --name mongodb -d mongo:4.0.2
    sudo docker exec -it mongodb bash
    sudo docker pull mongo:4.0.2

# Change rights:

add execution rights to a file

    sudo chmod +x concurrent_parallel_2/41_merge_sort.py

change owners

    sudo chown -R testuser:testuser /var/www/test/public_html
    sudo setfacl -m "u:mssql:rwx" /var/log

# SWAP 
## File size change:

check current size
   
    swapon -s

turn off

    swapoff -a

the total size of the swap file will be bs*count = 1M x 4096 = 4GB

    dd if=/dev/zero of=/swapfile bs=1M count=16384 -

make the swapfile usable again

    mkswap /swapfile

turn it ON

    swapon /swapfile

## File deletion:

    swapoff -v /swapfile

and remove line about /swapfile

    nano /etc/fstab

    rm -v /swapfile

## Get file back:

    dd if=/dev/zero of=/swapfile bs=1M count=4096
    sudo chmod 600 /swapfile 
    mkswap /swapfile
    swapon -v /swapfile

and add line about /swapfile `/swapfile swap swap defaults 0 0`

    nano /etc/fstab

# Symbolic link

    ln -s /path/to/original /path/to/link

# MongoDB:

    sudo systemctl status mongod
    sudo nano /etc/mongod.conf
    mongo --port 27017  --authenticationDatabase "admin" -u "gofr" -p ''
    mongoimport --db test --collection zips --file ~/Downloads/zips.json --port 27017  -u=gofr -p=password --authenticationDatabase admin

# Mount device:

check for the devices

    sudo lsblk

create a folder in which we shall mount

    sudo mkdir /media/TRANSCEND

mount/unmount

    sudo mount /sdb1 /media/TRANSCSEND
    sudo umount /media/TRANSCSEND

# Output
## redirect the output (AKA stdout) to a file:

    SomeCommand > SomeFile.txt  

## Append:

    SomeCommand >> SomeFile.txt

## If you want stderr as well use this:

    SomeCommand &> SomeFile.txt  

## or this to append:

    SomeCommand &>> SomeFile.txt  

## if you want to have both stderr and output displayed on the console and in a file use this:

    SomeCommand 2>&1 | tee SomeFile.txt

# Change text in a file:

    sudo sed -i 's/search/replace/g' /usr/share/applications/defaults.list 
    sudo sed -i 's/some\/path\/in\/file\/temp\///g' path/to/file 

Replace \ with /:

    echo 'C:\foo\bar' | sed 's/\\/\//g'

# Check open ports:

    sudo netstat -antup | grep <port>
    ss -ltn

# Allow connection on particular port:

    sudo ufw allow <port>/tcp

# Thunderbird

    sudo tar -x thunderbird-X.X.X.tar.bz2
    sudo cp -r ~/Downloads/thunderbird /usr/lib/

# Get audio track from video

    ffmpeg -i holaamigo.mov -vn -ac 2 audio.wav

# reverse audio 

    sox -V audio.wav backwards.wav reverse

# Flush DNS

    sudo systemd-resolve --flush-caches
    sudo /etc/init.d/dns-clean restart

# Copy wallpapers

    sudo mv Downloads/*.jpg /usr/share/backgrounds/
    sudo mv Downloads/*.png /usr/share/backgrounds/

# xfce shortcuts

    sudo nano ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

# Colours 

Very simple. Add these three lines to ~/.bashrc

    nano ~/.bashrc

    export LS_OPTIONS='--color=auto'
    eval "$(dircolors -b)"
    alias ls='ls $LS_OPTIONS'

# If you want to apply the changes in a running bash session, run:

    source ~/.bashrc

# Python environment

    virtualenv -p $(which python3) env-name 
    source /env-name/bin/activate 
    deactivate
    virtualenv env-name 

To change colour of env name in bash, change this string in `activate` file

    PS1="(`basename \"$VIRTUAL_ENV\"`) ${PS1-}"

to

    PS1="\[\e[1;35m\](`basename \"$VIRTUAL_ENV\"`)\[\e[1;35m\] ${PS1-}"


# Terminal theme

    sudo nano ~/.config/xfce4/terminal/terminalrc

here are theme files

    /usr/share/xfce4/terminal/colorschemes

local path to themes

    ~/.local/share/xfce4/terminal/colorschemes
    
# lightdm

    sudo lightdm-settings
    lightdm --test-mode -d
    /usr/share/applications/lightdm-gtk-greeter-settings.desktop
    /etc/lightdm/lightdm-gtk-greeter.conf

## some fixes for lightdm loading

Add this string (ExecStartPre) to `/lib/systemd/system/lightdm.service` file

    ExecStartPre=/bin/sh -c '[ "$(basename $(cat /etc/X11/default-display-manager 2>/dev/null))" = "lightdm" ]'

# tmux

`.bashrc`/`.profile` is not loaded on new tmux session (or window) 
at the end of your `.bash_profile`, put the line:

    . ~/.bashrc

`Ctrl + B` then `[` then you can use your normal navigation keys to scroll around (eg. `Up Arrow` or `PgDn`). Press `q` to quit scroll mode.

## resize pane in tmux

This assumes that you've hit `Ctrl + B` and `:` to get to the command prompt
`:resize-pane -L`

Here are some additional tmux pane resizing examples:

:resize-pane -D (Resizes the current pane down)  
:resize-pane -U (Resizes the current pane upward)  
:resize-pane -L (Resizes the current pane left)  
:resize-pane -R (Resizes the current pane right)  
:resize-pane -D 10 (Resizes the current pane down by 10 cells)  
:resize-pane -U 10 (Resizes the current pane upward by 10 cells)  
:resize-pane -L 10 (Resizes the current pane left by 10 cells)  
:resize-pane -R 10 (Resizes the current pane right by 10 cells)  

## tmux sessions

`tmux ls` / `Ctrl+B`, and then `S` to see a list of tmux sessions

    tmux new -s session-name 
    tmux attach -t 1

`Ctrl+B`, and then `D`, you will detach the session

    tmux attach-session -t session-name

## tmux To hop between windows, press Ctrl+B, and then one of the followings keys:

`N`: Display the next window.  
`P`: Display the previous window.  
`0` to `9`: Display a window numbered 0 to 9.  

## tmux keys

`Ctrl+B`, and then `Q` to make tmux briefly flash the number of each pane.  
`Ctrl+B`, and then `X` to close the current pane.

## tmux cheat sheet Ctrl+B

### Session Commands

`S`: List sessions.  
`$`: Rename current session.  
`D`: Detach current session.  
`Ctrl+B`, and then `?`: Display Help page in tmux.

### Window Commands

`C`: Create a new window.  
`,`: Rename the current window.  
`W`: List the windows.  
`N`: Move to the next window.  
`P`: Move to the previous window.  
`0` to `9`: Move to the window number specified.  

### Pane Commands

`%`: Create a horizontal split.  
`“`: Create a vertical split.  
`H` or `Left Arrow`: Move to the pane on the left.  
`I` or `Right Arrow`: Move to the pane on the right.  
`J` or `Down Arrow`: Move to the pane below.  
`K` or `Up Arrow`: Move to the pane above.  
`Q`: Briefly show pane numbers.  
`O`: Move through panes in order. Each press takes you to the next, until you loop   through all of them.  
`}`: Swap the position of the current pane with the next.  
`{`: Swap the position of the current pane with the previous.  
`X`: Close the current pane.  

# dev/null problem

    rm -f /dev/null; mknod -m 666 /dev/null c 1 3

# conky

autostart file

    sudo nano ~/.config/autostart/conky.desktop

configs

    sudo nano /etc/conky/conky.conf

# cmus

`1` - Library, the default view mode, including two tabs (artists/albums and songs in currently selected album)  
`2` - Sorted Library, which provides a playlist view allowing to jump to specific tracks (this view can be customized in view mode 6  
`3` - Playlist, editable playlist  
`4` - Play Queue, which displays the track queue  
`5` - File Browser  
`6` - Filters, a list of user-defined filters for the library  
`7` - Settings, which displays key bindings and commands   

`i` - jump view to the currently playing track (handy when in shuffle mode)  
`s` - toggle shuffle (read about the m key below if you're going to use shuffle)  

`z` - previous track  
`x` - restart track  
`c` - pause playback  
`v` - stop playback  
`b` - next track  
`m` - toggles the "aaa mode." aaa stands for artist, album, or all. If artist mode is on cmus will shuffle only between songs by the playing artist. In album mode cmus will shuffle between songs on the playing album. If all mode is on, cmus will shuffle between every song in your library. You can see the currently set "aaa mode" in the bottom right, next to where the display of the continue, repeat, and shuffle settings.  
`Press right/left` to seek by 10 seconds  
`Press *<*/*>*` seek by one minute  
`/` - searching cmus works as in many Unix programs. Typing slash, a string, and enter will find the first instance of that string in your library. Press n to go to the next string, N to go to the previous. cmus's search isn't case sensitive and is quite smart; a search for damned insurrection will return Bulldozer's "Insurrection of the Living Damned" (rad tune).  

`-` - reduce the volume by 10%  
`+` - increase the volume by 10%  

`:set softvol=true` - enable software volume control  
`:add /path/to/music/dir` - will add all the audio files from /path/to/music/dir to the library    
`:clear` - will clear the playlist  
`:save playlist.pls` - will save the current playlist  
`:load playlist.pls` - will load playlist.pls   
`:colorscheme xterm-white` (see /usr/share/cmus/*.theme)  

## update library

`:clear` - clear library
`:add ~/Music` - add directory
`:update-cache -f` - update cache just in case

# desktop & autostart

files that whisker use to build menu

    /usr/share/applications/*.desktop

autostart files (look at `conky.desktop` for example)

    ~/.config/autostart/*.desktop - 

# Date

    date
    date +"%Y-%m-%d"
    touch $(date +"%Y-%m-%d")

# Feh

open in fullscreen

    feh -F

opens in scaled window

    feh --scale-down

show a list of files

    feh -l

# Calculate number of files in direcory tree

print all with humanreadable size with level 1 only

    tree -ah -L 1

    find . -maxdepth 1 -type f | wc -l

# steam

    ~/.local/share/Steam/steamapps/common/

# Date & time control

    timedatectl

or `no` to enable/disable auto update

    timedatectl set-ntp yes

or 20:20:20 to set specific date/time

    timedatectl set-time 2021-06-14

set timezone

    timedatectl set-timezone Region/Location
    timedatectl list-timezones 

# How to Change the Start Order of Processes in Linux

    cd /etc

that the list of all processes 

    tree rc*.d

f.e. you want to move `S15proc2` over `S10proc1`

    mv S15proc2 S09proc2

or use 

    update-rc.d 

# To create custom script

    cd /usr/local/bin
    sudo touch script-name
    sudo chmod +x script-name

to run it

    /usr/local/bin/script-name

# Remove duplicates from bash history

add this string to ~/.bashrc

    export HISTCONTROL="ignoreboth:erasedups" 

# Get previous command & arguments

## this will execute last command with sudo

    sudo !!

## gets the first element of the previous command line argument

    rm -rf dir
    cd !$
    
will give you "-rf"

## gets the last element of the previous command line argument

    rm -rf dir
    cd !$

will give you "dir"

## the n'th word from the previous command line

    tar xf some-file
    echo !:1 

will give you "xf"

# Push the process to the background 

add "&" at the end of your command

## list all commands that are currently running in background

    jobs

## bring job from background

    fg %1

## push job to the background 

    bg %1

# Samba network share

install samba

    sudo apt install samba

set password for samba user

    sudo smbpasswd -a username

open samba config file

    sudo nano /etc/samba/smb.conf

and add info about directory you want to share

    [dirname]
    path = /home/username/dirname
    valid users = username
    read only = yes

Or instead of `valid users` use `guest`

    guest ok = yes

then restart samba for changes to take an effect

    sudo service smbd restart

# nano show line numbers

    nano ~/.nanorc
    
add this line

    set linenumbers

also consider uncommenting this line in `/etc/nanorc`

# nvidia drivers

## NVIDIA System Management Interface

    nvidia-smi
    nvidia-smi -q

## check available for installation nvidia drivers

    apt search nvidia-driver

## check installed nvidia drivers

    sudo apt list | grep nvidia
    sudo ubuntu-drivers devices

## which loadable kernel modules are currently loaded

    lsmod | grep nvidia

## automatically install drivers
    
    sudo ubuntu-drivers install nvidia-driver-470

# matrix in terminal
    
    sudo apt install cmatrix
    cmatrix

