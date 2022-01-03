# Just a smal decoration
pfetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History
mkdir -p ~/.cache/zsh
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt appendhistory

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
setopt no_nomatch
_comp_options+=(globdots)               # Include hidden files.

# Custom ZSH binds
bindkey '^ ' autosuggest-accept

# Dynamic window title with zsh shell.
# Shows current directory and running (multi-line) command.
case "$TERM" in (rxvt|rxvt-*|st|st-*|*xterm*|(dt|k|E)term)
	preexec () {
		print -Pn "\e]2;%~ | ${(j:\n:)}${(f)1}\a"
	}
	precmd () {
		print -Pn "\e]2;%~\a"
	}
  ;;
esac

# Aliases
source "$HOME/.config/zsh/aliasrc"

# Plugins
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source ~/.config/zsh/autojump/autojump.zsh 2>/dev/null
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh

# MPD daemon start (if no other user instance exists)
#[[ ! -s ~/.config/mpd/mpd.pid ]] && mpd

#[[ $(pgrep picom) = "" ]] && picom -e 1 --vsync -D 5 -i 1 -b

#[[ $(pgrep redshift) = "" ]] && redshift -t 6500:4000 &

#[[ $(pgrep xss-lock) = "" ]] && xss-lock -q slock &


