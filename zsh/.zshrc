# Envs
export EDITOR=nvim
export MANPAGER="$EDITOR +Man!"
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin
export AUTO_NOTIFY_THRESHOLD=20
export AUTO_NOTIFY_TITLE="Hey! '%command' has just finished"
export AUTO_NOTIFY_BODY="It completed in %elapsed seconds"

# Print pokemon
krabby random --no-title

# Plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d $ZINIT_HOME ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-auto-notify
zinit light fdellwing/zsh-bat

# Snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit -C
zinit cdreplay -q

autoload -U select-word-style
select-word-style bash

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HISTDUPE=erase

# zsh options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Aliases

## Base

alias ls='eza -T --group-directories-first -L 1 --icons always'
alias v="nvim"
alias zshconf="$EDITOR ~/.zshrc && source ~/.zshrc"
alias nixconf="sudoedit /etc/nixos/configuration.nix"

## Git

alias gc="git clone"
alias gcm="git commit"
alias gcl="git clean"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gap="git add --patch"
alias gr="git restore"
alias grs="git reset"
alias gp="git push"
alias gpl="git pull"
alias gl="git log --oneline"
alias gb="git branch"
alias gi="git init"

## Docker

alias dp="docker pull"
alias dps="docker ps"
alias di="docker images"
alias dr="docker rm"
alias drmi="docker rmi"
alias dc="docker compose"
alias dcd="docker compose down"
alias dcu="docker compose up"
alias dcr="docker compose restart"
alias dcl="docker compose logs"

# Completion styling
zstyle ':completion:*' matcher-list \
    'm:{[:lower:]}={[:upper:]}' \
    'l:|=* r:|=*' \
    'r:|=*'
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:*:*:*:files' ignored-patterns ''
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always --icons=always $realpath'

# Functions
detect_virtualenv() {
  if [[ -z "$VIRTUAL_ENV" ]] ; then
    # If env folder is found, activate the virtualenv
    if [[ -d ./venv ]] ; then
      source ./venv/bin/activate
    elif [[ -d ./.venv ]] ; then
      source ./.venv/bin/activate
    fi
  else
    # Check if the current folder belongs to the earlier VIRTUAL_ENV folder
    # If not, deactivate the virtual environment
    parentdir="$(dirname "$VIRTUAL_ENV")"
    if [[ "$PWD"/ != "$parentdir"/* ]] ; then
      deactivate
    fi
  fi
}

## Delete all containers
ddac() {
  docker rm -vf $(docker ps -aq)
}

## Delete all images
ddai() {
  docker rmi -f $(docker images -aq)
}

traceroute-mapper() {
  traceroute=$(traceroute -q1 $* | sed ':a;N;$!ba;s/\n/%0A/g')
  xdg-open "https://stefansundin.github.io/traceroute-mapper/?trace=$traceroute"
}

# Run Python virtualenv detection script
autoload -U add-zsh-hook
add-zsh-hook chpwd detect_virtualenv

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd cd)"
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"
