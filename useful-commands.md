# directories

## create a directory

    mkdir dir-name

## current directory

    pwd

## directory structure

    ls -lah /dir

The first letter represents:  

`-` file  
`d` directory  
`c` charecter (tty)  
`b` block (some device)  
`l` link  
`p` pipes  
`s` socket (p and s used for process to communicate w/ each other

# php

    php -v
    cd to directory where files are
    php -S localhost:9000

# service management

## dbms: mssql-server, postgresql.service, mongod

    sudo systemctl stop service-name
    sudo systemctl disable service-name
    sudo systemctl enable service-name
    sudo systemctl start service-name
    sudo systemctl restart service-name
    sudo systemctl status service-name
    
    sudo /etc/init.d/service-name restart

## find out all services that have been run at startup:

    systemctl list-units --type service
    systemctl is-active service-name

## show list of dependencies:

    systemctl list-dependencies --before timers.target
    systemctl list-dependencies --after timers.target

## read journal info (last 30 entries)

    journalctl -u mssql-server | tail -30

# edit files

    sudo nano Directory/file

# basic copy

    sudo cp Directory/file /Destination/Directory/

# find files/folders:

    sudo locate what-to-search

# show data from file

    cat /path/to/file

## show last rows from file

    tail /path/to/file

## show first rows from file

    head /path/to/file
    
## show with scrolling

    less /path/to/file

# working with locale

    locale -a
    sudo locale-gen "en_US.UTF-8"
    sudo dpkg-reconfigure locales
    sudo nano /etc/default/locale

## set first weekday (or other parameters)

    sudo nano /usr/share/i18n/locales/en_US

change in `LC_TIME` `first_weekday 1` to `first_weekday 2`

    sudo locale-gen

# install/unpack deb package:

    sudo apt install ./path/to/file.deb
    sudo dpkg -i ./path/to/file.deb
    sudo dpkg -i ./path/to/file.deb --auto-deconfigure
    sudo apt --fix-broken install

## list all
    
    dpkg -l
    dpkg --get-selections

## show info

    dpkg -f ./path/to/file.deb

## delete

    sudo dpkg -P package-name
    sudo dpkg -r package-name
    sudo dpkg --remove package-name

# clean/update/upgrade:

    sudo apt-get clean && sudo apt-get update && sudo apt-get upgrade
    sudo apt autoremove
    sudo apt-get autoclean
    sudo apt --fix-broken install

# ppa repositories

## with apt

    sudo apt-add-repository ppa:<ppa to add>
    sudo add-apt-repository -r ppa:<ppa to remove>
    
## manually

check files here:

    /etc/apt/sources.list.d/

and this file:

    /etc/apt/sources.list

then:

    sudo apt update

# upgrade/update ubuntu version:

## check new version availability

    do-release-upgrade -c 

## perform upgrade

    sudo do-release-upgrade 

## check what type of distribution you have/want lts|normal etc

    sudo nano /etc/update-manager/release-upgrades

# update private keys

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys HASHOFTHEKEY

# turn-off computer

    upower -d
    shutdown

# remove software

    sudo apt purge software
    sudo apt-get purge software
    sudo apt remove software

# check linux version and hardware:

## kernel

    uname -a

## memory usage

    free -mh
    top
    htop 

## distro

    cat /etc/*-release 
    lsb_release -a 
    cat /etc/issue

## processor

    cat /proc/cpuinfo
    
## ip address & ethernet adapters

    ip a
    ifconfig
    
## check open ports:

    sudo netstat -antup | grep <port>
    ss -ltn

### allow connection on particular port

    sudo ufw allow <port>/tcp

### flush dns

    sudo systemd-resolve --flush-caches
    sudo /etc/init.d/dns-clean restart
    
## all info

    lshw

## check video

    glxinfo|egrep "OpenGL vendor|OpenGL renderer"

## list usb devices

    lsusb
    
## get system hardware information

    sudo dmidecode
    sudo dmidecode --type memory
    sudo dmidecode --type system

# change machine name (or hostname)

    sudo nano /etc/hosts
    sudo nano /etc/hostname

# python

at first download from off-site

    tar xf python-X.X.X.tar.xz

go to catalog

    sudo ./configure --enable-optimization 
    sudo ./configure --prefix=/usr --sysconfdir=/etc

to overwright current default

    sudo make install

to install one more instance

    sudo make altinstall 

## install pygame you need some dependencies

    sudo apt install libsdl1.2-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-ttf2.0-dev libsdl1.2-dev libsmpeg-dev python-numpy subversion libportmidi-dev ffmpeg libswscale-dev libavformat-dev libavcodec-dev
    sudo pip3 install pygame
    sudo pip3 install superwires

# change image size right in terminal:

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

if the file is big it will cut 1920x1080 in one file and put other stuff in second file

# file info 

## get file info

    identify file
    identify file.png | awk '{print $1,$2}'

## show type of file

    file <filename>

## shows detailed info about file

    stat <filename>

# rtfm

## search for commands

    apropos .
    apropos files
    apropos "remove files"

## search for description of particular command

    whatis rm

## show man-page

    man <command>

### navigation

`f` `b` - up down  
`/SearchString` - to search 

### spec section number:

man 7 man goes to 7 section of man manual

## show the path where command is located:

    which <command>

# search directory and subdirectories for some-text in files

    grep -rw /dir-name -e 'some-text'

# super user 

## starts sudo session w/o password prompt every few minutes

    sudo -s 

## stop sudo session

    sudo -k 
    exit

# grep examples

    grep "Trick" tricks.py --colour=always -n

`i` - case insensitive  
`v` - invert-match  
`n` - row numbers  
`E` - regexp  

# working with csv (or text):

    awk -F ';' '{print $1 '\t' $3}' sample.csv | sort -t

## will remove duplicated

    sort -u file.ext
    
## use sed to replace charecters in the string (replaces xy with 1)

    string="abcxyabcxyabc"
    echo "$string" | sed -r 's/[xy]+/1/g'

# archive

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

## zip to archive files

    zip name_of_archive * 

add `-e` for password protection
    
    unzip <path to zip file> -d <dest directory>
    
## gzip 

    gzip -dr ~/file.gz
    gzip -c filename > filename.gz or gzip -k filename
    gzip -r directory

# disk usage

## disk space used on a mount level

    df -h

## disk usage (human readable, only first level of objects) sorted 

    du / -h -d 1 | sort -h  

# files

## create file (fast)

    touch <filename>
    
## rename files in directory (replace _ with _)

    for a in $(ls -1 .); do mv $a ${a//_/-}; done
    for f in *\ *; do mv "$f" "${f// /-}"; done
    
## add some text to every string in one file and write it to another one

    awk '{print "Random text "$0}' foo.txt >> foo1.txt
    
## uppercase to lowercase

    for f in *.*; do mv "$f" "${f,,}"; done
    
# change text in a file:

    sudo sed -i 's/search/replace/g' /usr/share/applications/defaults.list 
    sudo sed -i 's/some\/path\/in\/file\/temp\///g' path/to/file 

## example of replacing \ with /:

    echo 'C:\foo\bar' | sed 's/\\/\//g'
    
# update locate cache:

    sudo updatedb

# anaconda:

## list of all packages

    conda list

## list of environments

    conda info --envs

## activate/deactivate env

    conda activate <myenv-name>
    conda deactivate

## update all packages in the current environment to the latest version

    conda update --all

# jupyter

    jupyter notebook stop
    jupyter notebook
    jupyter notebook list

# add user to group

## add user to some group

    usermod -a -G examplegroup exampleusername

## list of all groups

    getent group

# virtualbox

    sudo dpkg -i virtualbox-6.1_6.1.22-144080~Ubuntu~eoan_amd64.deb
    sudo VBoxManage extpack install --replace Oracle_VM_VirtualBox_Extension_Pack-6.1.22.vbox-extpack

## update to a new version

### check what's installed

    dpkg -l | grep virtualbox

### remove old version (see previous command)

    sudo dpkg -r virtualbox-7.0

# SQL Server features install

## SSIS

    sudo apt-get install mssql-server-is

## Full-Text Search

    sudo apt-get install mssql-server-fts

## (Server Agent) 

### in 2017

    sudo apt-get install mssql-server-agent 

### in 2019

    sudo /opt/mssql/bin/mssql-conf set sqlagent.enabled true 

# docker

## check state

    systemctl show --property ActiveState docker
    systemctl show --property ActiveState containerd

    sudo systemctl status docker
    sudo systemctl status containerd

## check available containers

    sudo docker ps -a

## start/stop containers

    docker start/stop imagename

## run a command in a new container

    docker run imagename

## to enter a container through terminal

    docker exec -it imagename bash

## list of data volumes

    docker volume ls

    docker run -e'ACCEPT_EULA=Y' -e'MSSQL_SA_PASSWORD=Password' --name sqlserverN -d microsoft/mssql-server-linux:2019-latest -v datavolumename:/path/to/dbs

## remove image

    docker rm imagename

## other 

    sudo docker container ls
    sudo docker images
    sudo docker rm -f 6435c446a2a3bb8416d88959c7d47b5c5f56ef1b9a98d83452fc85f2328bb6bb 
    sudo docker run -it -v mongodata:/data/db -p 27019:27017 --name mongodb -d mongo:4.0.2
    sudo docker exec -it mongodb bash
    sudo docker pull mongo:4.0.2

# change rights

## add execution rights to a file

    sudo chmod +x concurrent_parallel_2/41_merge_sort.py

## change owners

    sudo chown -R testuser:testuser /var/www/test/public_html
    sudo setfacl -m "u:mssql:rwx" /var/log

# swap 

## file size change

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

## file deletion

    swapoff -v /swapfile

and remove line about /swapfile

    nano /etc/fstab

    rm -v /swapfile

## get file back online

    dd if=/dev/zero of=/swapfile bs=1M count=4096
    sudo chmod 600 /swapfile 
    mkswap /swapfile
    swapon -v /swapfile

and add line about /swapfile `/swapfile swap swap defaults 0 0`

    nano /etc/fstab

# create symbolic link

    ln -s /path/to/original /path/to/link

# mongodb

    sudo systemctl status mongod
    sudo nano /etc/mongod.conf
    mongo --port 27017  --authenticationDatabase "admin" -u "gofr" -p ''
    mongoimport --db test --collection zips --file ~/Downloads/zips.json --port 27017  -u=gofr -p=password --authenticationDatabase admin

# mount device

## check for the devices

    sudo lsblk

## create a folder in which we shall mount

    sudo mkdir /media/TRANSCEND

## mount/unmount

    sudo mount /sdb1 /media/TRANSCSEND
    sudo umount /media/TRANSCSEND

# output

## redirect the output (aka `stdout`) to a file

    SomeCommand > SomeFile.txt  

## append

    SomeCommand >> SomeFile.txt

## if you want `stderr` as well use this

    SomeCommand &> SomeFile.txt  

## or this to append

    SomeCommand &>> SomeFile.txt  

## if you want to have both `stderr` and `stdout` displayed on the console and in a file use this

    SomeCommand 2>&1 | tee SomeFile.txt

# thunderbird

    sudo tar -x thunderbird-X.X.X.tar.bz2
    sudo cp -r ~/Downloads/thunderbird /usr/lib/

# get audio track from video

    ffmpeg -i holaamigo.mov -vn -ac 2 audio.wav

# reverse audio 

    sox -V audio.wav backwards.wav reverse

# copy wallpapers

    sudo mv Downloads/*.jpg /usr/share/backgrounds/
    sudo mv Downloads/*.png /usr/share/backgrounds/

# xfce shortcuts

    sudo nano ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml

# colours in terminal for ls

## add these three lines to ~/.bashrc

    nano ~/.bashrc

    export LS_OPTIONS='--color=auto'
    eval "$(dircolors -b)"
    alias ls='ls $LS_OPTIONS'

# if you want to apply the changes in a running bash session, run:

    source ~/.bashrc

# python environment

    virtualenv -p $(which python3) env-name 
    source /env-name/bin/activate 
    deactivate
    virtualenv env-name 

## to change colour of env name in bash, change this string in `activate` file

    PS1="(`basename \"$VIRTUAL_ENV\"`) ${PS1-}"

to

    PS1="\[\e[1;35m\](`basename \"$VIRTUAL_ENV\"`)\[\e[1;35m\] ${PS1-}"

# terminal theme

    sudo nano ~/.config/xfce4/terminal/terminalrc

## here are theme files

    /usr/share/xfce4/terminal/colorschemes

## local path to themes

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

## autostart file

    sudo nano ~/.config/autostart/conky.desktop

Content of the file:  

    [Desktop Entry]
    Type=Application
    Name=conky
    Exec=conky --daemonize --pause=5
    StartupNotify=false
    Terminal=false

## configs

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

# feh

## open in fullscreen

    feh -F

## opens in scaled window

    feh --scale-down

## show a list of files

    feh -l

# Calculate number of files in direcory tree

## print all with humanreadable size with level 1 only

    tree -ah -L 1
    find . -maxdepth 1 -type f | wc -l

# find a file in directory with wildcard

    find /path/to/file/ -iname filename*

# steam

    ~/.local/share/Steam/steamapps/common/

# date & time control

    timedatectl

## or `no` to enable/disable auto update

    timedatectl set-ntp yes

## or 20:20:20 to set specific date/time

    timedatectl set-time 2021-06-14

## set timezone

    timedatectl set-timezone Region/Location
    timedatectl list-timezones 

# date

    date
    date +"%Y-%m-%d"
    touch $(date +"%Y-%m-%d")
    
# How to Change the Start Order of Processes in Linux

    cd /etc

that the list of all processes 

    tree rc*.d

f.e. you want to move `S15proc2` over `S10proc1`

    mv S15proc2 S09proc2

or use 

    update-rc.d 

# create custom script

    cd /usr/local/bin
    sudo touch script-name
    sudo chmod +x script-name

## to run it

    /usr/local/bin/script-name

# remove duplicates from bash history

add this string to ~/.bashrc

    export HISTCONTROL="ignoreboth:erasedups" 

# get previous command & arguments

## this will execute last command with sudo

    sudo !!

## gets the first element of the previous command line argument

    rm -rf dir
    cd !$
    
will give you `-rf`

## gets the last element of the previous command line argument

    rm -rf dir
    cd !$

will give you `dir`

## the n'th word from the previous command line

    tar xf some-file
    echo !:1 

will give you `xf`

# push the process to the background 

add "&" at the end of your command

## list all commands that are currently running in background

    jobs

## bring job from background

    fg %1

## push job to the background 

    bg %1

# samba network share

## install samba

    sudo apt install samba

## set password for samba user

    sudo smbpasswd -a username

## open samba config file

    sudo nano /etc/samba/smb.conf

## and add info about directory you want to share

    [dirname]
    path = /home/username/dirname
    valid users = username
    read only = yes

Or instead of `valid users` use `guest`

    guest ok = yes

## restart samba for changes to take an effect

    sudo service smbd restart

# nano

## Show linenumbers and cursor position

open `.nanorc`

    nano ~/.nanorc
    
add these lines

    set linenumbers
    set constantshow

consider uncommenting this line in `/etc/nanorc`  
also, you can use `c` `--constantshow` and `l` `--linenumbers` flags when launching nano  

    nano -cl filename

## Some hotkeys

`Ctrl+6` - [Mark Set] use arrows or PgUp/PgDown, Home/End to select a part of text  
`Alt+6` - Copy selected text or a whole row  
`Ctrl+K` - **K**ut selection or a whole row  
`Ctrl+U` - Paste string (**U**n**k**ut)   
`Alt+3` - Comment/Uncomment line  
`Esc+Shift+3` - show linenumbers on the left  
`Ctrl+C` - Show current cursor position on the bottom  

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

## install drivers

manual:  
    
    sudo ubuntu-drivers install nvidia-driver-535

install recommended driver automatically:  

    sudo ubuntu-drivers install

# matrix in terminal
    
    sudo apt install cmatrix
    cmatrix

# show login activity

## the last command displays a list of the most recently logged in users

    last

## lastb command displays a list of bad (failed) logins

    lastb

## who report which users are logged in to the system

    who

# bash script 

## with input

    read x
    read y
    
    if [ $y != 0 ]
    then
      echo "$(($x+$y))" 
      echo "$(($x-$y))"
      echo "$(($x*$y))"
      printf "%d\n" "$(($x/$y))"
    fi
    
    read name
    echo "Welcome $name"

## with loop

    for i in {1..50}; do echo $i; done
    for i in {1..99..2}; do echo $i; done

## comparing numbers

    read x
    read y 
    
    if [ $x -gt $y ]
    then
      echo "X is greater than Y"
    elif [ $x -eq $y ]
    then
      echo "X is equal to Y"
    else 
      echo "X is less than Y"
    fi

## comparing text

    read x 
    
    if [ $x == "y" ] || [ $x == "Y" ]
    then
       echo "YES"
    elif [ $x == "n" ] || [ $x == "N" ]
    then
       echo "NO"
    else 
       echo ""
    fi

# get cover art from mp3

    ffmpeg -i file.mp3 file.jpg

# check hdd/ssd for badblocks

    badblocks -sv /dev/sda

# check web-cam

    ffplay /dev/video0

# mpv

## Launch file with particular audio/sub

    mpv filename.mkv --aid=3 --sid=6

## Launch file with external audio/subs

    mpv file.mkv --audio-file=track-path.mka --sub-file=subs-path.ass 

# snap

## List packages

    snap list --all

## Remove old versions manually

    sudo snap remove --revision rev-num package

## Completely purge/remove package

    sudo snap remove --purge firefox