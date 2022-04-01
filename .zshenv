export EDITOR=nvim
export BROWSER=brave

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

export XDG_DESKTOP_DIR="$HOME/desktop"
export XDG_DOWNLOAD_DIR="$HOME/downloads"
export XDG_DOCUMENTS_DIR="$HOME/documents"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pictures"
export XDG_SCREENSHOTS_DIR="$HOME/pictures/screenshots"
export XDG_VIDEOS_DIR="$HOME/videos"

export DOCKER_BUILDKIT=1
export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
export DOTNET_CLI_TELEMETRY_OPTOUT=1
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
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export RANGER_LOAD_DEFAULT_RC=FALSE
export VSCODE_PORTABLE="$XDG_DATA_HOME/vscode"
export RANDFILE="$XDG_CACHE_HOME/.rnd"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
export SSB_HOME="$XDG_DATA_HOME/zoom"
export GOPATH="$XDG_DATA_HOME/go"

# export PATH="$PATH:/usr/lib"
export PATH="$HOME/code/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/npm/bin:$PATH"
export PATH="$HOME/.luarocks/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="node_moudles/.bin:$PATH"

export JAVA_HOME="/usr/java/jdk1.8.0_101"
export _JAVA_OPTIONS="-Xmx4096m"

# Rebind caps lock to escape
setxkbmap -option caps:escape
