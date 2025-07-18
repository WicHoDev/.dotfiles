# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$HOME/.scripts/:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.zsh/.oh-my-zsh"
ZSH_CUSTOM="$ZSH/custom"

# Theme does not need to be set because of STARSHIP shell prompt
# ZSH_THEME="blinks"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh  #need to install autosuggestion plugin
eval "$(starship init zsh)" > /dev/null

# ----- User configuration ----- #
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# Auto-start Hyprland on tty1 when zsh starts
# if [[ -z "$DISPLAY" && "$(tty)" == "/dev/tty1" && -z "$WAYLAND_DISPLAY" ]]; then
#     exec Hyprland
# fi

# ps -p $SSH_AGENT_PID > /dev/null || eval "$(ssh-agent -s)"
if [[ -z "$SSH_AUTH_SOCK" || ! -S "$SSH_AUTH_SOCK" ]]; then
    # If not running, start the ssh-agent and add the key
    eval $(ssh-agent -s) > /dev/null \
    ssh-add ~/.ssh/github > /dev/null 2>&1 \n
    clear
    # tmux new -d -s dev
else
    clear
fi

if uwsm check may-start > /dev/null; then
    exec systemd-cat -t uwsm_start uwsm start hyprland.desktop
fi

export EDITOR=nvim
export VISUAL=nvim

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.

# eza is needed
#     `sudo packman -s eza`
alias ls="eza --color=always --long --git --icons=always --no-time --no-user --no-permissions" \
alias lsl="eza --color=always --long --git --icons=always --no-time --no-user" \
alias tree="ls --tree" \
alias cl="clear" \
alias vim='nvim'

# export PATH=$PATH:~/.programingLanguages/zig/zig-x86_64-linux-0.14.1/
export PATH=$PATH:~/.programingLanguages/zig/zig-x86_64-linux-0.15.0-dev.905+edf785db0/ #dev version uncomment if needed 
