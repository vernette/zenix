# Envs
export EDITOR=nvim
export MANPAGER="$EDITOR +Man!"
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin
export AUTO_NOTIFY_THRESHOLD=20
export AUTO_NOTIFY_TITLE="Hey! '%command' has just finished"
export AUTO_NOTIFY_BODY="It completed in %elapsed seconds"
export FZF_DEFAULT_COMMAND="fd --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --hidden --exclude .mypy_cache --exclude .ruff_cache --exclude venv --exclude .venv"

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

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HISTDUPE=erase

# Zsh options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# Completions
autoload -Uz compinit && compinit -C
zinit cdreplay -q

zstyle ':completion:*' matcher-list \
    'm:{[:lower:]}={[:upper:]}' \
    'l:|=* r:|=*' \
    'r:|=*'
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:*:*:*:files' ignored-patterns ''
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

zstyle ':fzf-tab:complete:eza:*' fzf-preview '[[ -d $realpath ]] && eza --color=always --icons=always --oneline $realpath || bat --color=always --style=numbers $realpath || cat $realpath'
zstyle ':fzf-tab:complete:rm:*' fzf-preview '[[ -d $realpath ]] && eza --color=always --icons=always --oneline $realpath || bat --color=always --style=numbers $realpath || cat $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always --icons=always --oneline $realpath'

# ZLE
autoload -U select-word-style
select-word-style bash

# Keybindings
bindkey -e
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Aliases

## Base
alias ls="eza --icons always --tree --group-directories-first --level 1 --time-style long-iso"
alias v="nvim"
alias zshconf="$EDITOR ~/.zshrc && source ~/.zshrc"

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
alias gsh="git show"
alias gst="git stash"

## Docker
alias dps="docker ps"
alias di="docker images"
alias drmi="docker rmi"
alias dc="docker compose"
alias dcd="docker compose down"
alias dcu="docker compose up"
alias dcr="docker compose restart"
alias dcl="docker compose logs"

## Etc
alias habr-nvim="NVIM_APPNAME=habr-nvim $EDITOR"

# Functions
function auto_venv() {
  local venv_dirs=("venv" ".venv" "env" ".env" "virtualenv")

  if [[ -n "$VIRTUAL_ENV" ]]; then
    local venv_parent="${VIRTUAL_ENV:h}"
    if [[ "$PWD" != "$venv_parent"* ]]; then
      deactivate
    else
      return
    fi
  fi

  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    for venv_dir in "${venv_dirs[@]}"; do
      if [[ -f "$dir/$venv_dir/bin/activate" ]]; then
        source "$dir/$venv_dir/bin/activate"
        return
      fi
    done
    dir="${dir:h}"
  done
}

function get_cdn() {
  local ip
  local domain="$1"
  local dns="1.1.1.1"
  ip=$(dig +short "$domain" "@$dns" "+https" | head -1)
  curl -s "https://ipinfo.io/$ip" | jq
}

function git_stats() {
  local n="${1:-1}"
  git diff HEAD~${n}..HEAD --shortstat
}

function code2png() {
  local file="$1"
  local border_radius=8
  local theme="tokyonight-storm"
  local args=(--border.radius "$border_radius" --theme "$theme")

  if [[ $# -eq 3 ]]; then
    args+=(--language "$2")
  fi

  freeze "$file" "${args[@]}" --output "${@: -1}"
}

# Hooks
autoload -U add-zsh-hook
add-zsh-hook chpwd auto_venv

# Shell integrations
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # Older fzf versions
eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd cd)"
eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/config.toml)"
