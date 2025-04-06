# Enable command auto-completion
autoload -Uz compinit
compinit

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
alias pn='pnpm start'
alias np='npm run dev'
alias bat='batcat'
alias cb='~/tech/BashScripting/Project/cb.sh'



unset SSH_ASKPASS
export SSH_ASKPASS_REQUIRE=never
# ssh config
# Start SSH agent automaticallyi
#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_ed25519

#if [ -z "$SSH_AUTH_SOCK" ]; then
#   eval "$(ssh-agent -s)"
#fi
# Add your SSH key to the agent
#ssh-add ~/.ssh/id_ed25519

# Start or find SSH agent
SSH_ENV="$HOME/.ssh/agent-environment"

# Start the ssh-agent and store environment variables
function start_ssh_agent {
    # Start agent and store details to file
    ssh-agent > "${SSH_ENV}"
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    ssh-add ~/.ssh/id_ed25519
}

# Check if agent-environment exists
if [ -f "${SSH_ENV}" ]; then
    # Source the environment
    . "${SSH_ENV}" > /dev/null

    # Test if agent is still running
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        # If not running, start new agent
        start_ssh_agent
    }
else
    # If no environment file exists, start agent
    start_ssh_agent
fi
# Set PATH (Modify if needed)
export PATH=$HOME/bin:/usr/local/bin:$PATH

export STARSHIP_CONFIG="$HOME/.config/starship.toml"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"


if command -v eza >/dev/null 2>&1; then
  alias ls='eza --color=always --icons=always --no-user'
fi

# Autosuggestions
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax Highlighting (must be the last plugin)
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH=/home/lelouch/bin:/usr/local/bin:/home/lelouch/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/lelouch/go/bin


# bindkey -s '^K' 'sesh connect "$(sesh list -i | gum filter --limit 1 --no-sort --fuzzy --placeholder "Pick a sesh" --height 15 --prompt="⚡")"\n'

