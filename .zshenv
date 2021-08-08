export EDITOR=nvim
export BROWSER=brave

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

export DOCKER_BUILDKIT=1
export LESSHISTFILE=-

export ANDROID_SDK_ROOT=/home/puzonas/Android/Sdk
export ANDROID_HOME=/home/puzonas/Android/Sdk
export ANDROID_NDK_HOME="/home/puzonas/Android/Sdk/ndk/21.3.6528147"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export HISTFILE="$XDG_DATA_HOME/bash/history"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export RANGER_LOAD_DEFAULT_RC=FALSE
export VSCODE_PORTABLE="$XDG_DATA_HOME/vscode"
export RANDFILE="$XDG_CACHE_HOME/.rnd"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
export SSB_HOME="$XDG_DATA_HOME/zoom"
export TASKRC="$XDG_CONFIG_HOME/task/taskrc"
export GOPATH="$XDG_DATA_HOME/go"

# export PATH="$PATH:/usr/lib"
export PATH="$HOME/code/shell:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/npm/bin:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"

export JAVA_HOME="/usr/java/jdk1.8.0_101"
export _JAVA_OPTIONS="-Xmx4096m"

# Rebind caps lock to escape
setxkbmap -option caps:escape

# Remove teams from autostart, because every time that teams is launched
# This file is re-created
# rm ~/.config/autostart/teams.desktop
