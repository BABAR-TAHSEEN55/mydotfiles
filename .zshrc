
# Enable command auto-completion
# Measures Start Time 
# zmodload zsh/zprof

autoload -Uz compinit
if [ "$(date +'%j')" != "$(date -d "$(stat -c %y ~/.zcompdump 2>/dev/null)" +'%j' 2>/dev/null)" ]; then
  compinit
else
  compinit -C
fi
# Aliases
alias ls='ls --color=auto'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias cls='clear'
alias cdd='cd ~'
alias vim='nvim'
alias ga='git add'
alias gm='git commit -m'
alias gs='git status'
alias gll='git log --oneline'
alias gp='git push'
alias ff='fastfetch'
alias tmux='tmux -u'
alias tn='tmux new -s'
alias ts='tmux ls'
alias tk='tmux kill-server'
alias to='tmux a -t'
alias tkk='tmux kill-session -t'
alias btop='btop --utf-force'
alias nf='neofetch'
alias pn='pnpm run dev'
alias bat='batcat'
alias fn='fdfind'
alias gs='gh copilot suggest'
alias ge='gh copilot explain'
alias mux='tmuxinator'
alias xx='xdg-open .'

export PATH="$PNPM_HOME:$PATH"

unset SSH_ASKPASS
export SSH_ASKPASS_REQUIRE=never

# SSH Agent Setup
SSH_ENV="$HOME/.ssh/agent-environment"

function start_ssh_agent {
    ssh-agent > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    ssh-add ~/.ssh/id_ed25519
}

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_ssh_agent
    }
else
    start_ssh_agent
fi

# Set PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Starship + Zoxide
export STARSHIP_CONFIG="$HOME/.config/starship.toml"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

# eza alias override
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --color=always --icons=always --no-user'
fi

# zsh-autosuggestions performance tweaks
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
# Autosuggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax Highlighting (must be the last plugin)
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Additional PATH entries
export PATH="/home/lelouch/bin:/usr/local/bin:/home/lelouch/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/lelouch/go/bin"

# pnpm
export PNPM_HOME="/home/lelouch/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Envman
. "$HOME/.local/bin/env"
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Editor
export EDITOR=nvim
export VISUAL=nvim

# Go
export PATH="$HOME/go/bin:$PATH"

# History search
bindkey '^R' history-incremental-search-backward

# Erase in Insert Mode
bindkey -M viins '^?' backward-delete-char

# zprof profiling (optional)
# zprof
# eval "$(fnm env)"

# fnm
FNM_PATH="/home/lelouch/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/lelouch/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

if command -v tmux &> /dev/null; then
  [ -z "$TMUX" ] && exec tmux
fi
