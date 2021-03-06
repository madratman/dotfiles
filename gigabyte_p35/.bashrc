# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
     *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# tx2
alias ssh_tx2_public_ip="ssh -p 8890 nvidia@128.2.176.221"
alias ssh_tx2="ssh nvidia@192.168.0.100"
alias sshx_tx2="ssh -X nvidia@192.168.0.100"

# ros
source /opt/ros/indigo/setup.bash
#source /home/madratman/projects/ueye_ws/devel/setup.bash
alias srcws="source devel/setup.bash"
alias catkin_make_release="catkin_make -DCMAKE_BUILD_TYPE=Release"

# wire detection utils
alias view_input="rosrun image_view image_view image:=/wires_input"
alias view_pred="rosrun image_view image_view image:=/wires_pred"

# docker
alias docker_run="docker run -it -v /home/$USER:/home/$USER"
alias docker_ros_indigo="docker run -it -v /home/$USER:/home/$USER osrf/ros:indigo-desktop-full-trusty"
alias docker_rm_stopped_containers="docker rm -f $(docker ps -a -q)"
alias docker_rm_untagged_images="docker rmi -f $(docker images -q --filter "dangling=true")"

#git 
alias git_init_here="git init .; base_name=$(basename $(pwd)); git remote add github git@github.com:madratman/${base_name}.git"

alias kdevelop="/home/madratman/appimages/KDevelop.AppImage"
alias matlab="/home/madratman/matlab/matlab"
alias catkin_make_release="catkin_make -DCMAKE_BUILD_TYPE=Release"
alias catkin_make_clean="rm -rf build/ devel; catkin_make"
alias catkin_make_release_clean="rm -rf build/ devel/; catkin_make -DCMAKE_BUILD_TYPE=Release"

# gigabyte lan issues
alias accio_internet="sudo dhclient eth0"
alias killall_ros=killall_ros_func
alias killall_gazebo=killall_ros_gazebo

function killall_ros_func()
{
	kill -9 $(ps aux | grep ros | awk '{print $2}')
}

function killall_gazebo_func()
{
	kill -9 $(ps aux | grep gazebo | awk '{print $2}');
	kill -9 $(ps aux | grep gz | awk '{print $2}')
}

# https://askubuntu.com/questions/650032/gpg-errorthe-following-signatures-were-invalid-keyexpired
alias upgrade_expired_keys=update_expired_keys_func

function update_expired_keys_func()
{
	sudo apt-key list  | grep "expired: " | sed -ne 's|pub .*/\([^ ]*\) .*|\1|gp' | xargs -n1 sudo apt-key adv --keyserver keys.gnupg.net --recv-keys
}
#alias unreal=/home/madratman/software/UnrealEngine/Engine/Binaries/Linux/UE4Editor -opengl3
alias openshot="/home/madratman/software/OpenShot-v2.4.1-x86_64.AppImage"

alias rsync_resume="rsync -P -e ssh"
alias rosbag_set_time="rosparam set use_sim_time true"
alias rosbag_play_all="rosbag play *bag --clock"


## mavscout
alias ssh_mavscout_wifi="ssh -v ubuntu@192.168.8.1"
alias ssh_mavscout_lan="ssh -v ubuntu@192.168.0.200"

alias cmake_build="mkdir build && cd $_; cmake ..; make -j8"
alias cmake_build_install="mkdir build && cd $_; cmake ..; make -j8; sudo make install"
alias cmake_build_check="mkdir build && cd $_; cmake ..; make check -j8"
alias cmake_build_check_install="mkdir build && cd $_; cmake ..; make check -j8; sudo make install"