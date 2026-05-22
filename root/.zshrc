#If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$HOME/.scripts/:$PATH"

# Path to your Oh My Zsh installation.
export PRE_ZSH="$HOME/.config/.zsh"

export ZSH="$PRE_ZSH/.oh-my-zsh"
export HISTFILE="$PRE_ZSH/.history"
export ZSH_CUSTOM="$PRE_ZSH/custom"
export PLUGING="$PRE_ZSH/plugins"

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
source $PLUGING/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh  #need to install autosuggestion plugin
eval "$(starship init zsh)" > /dev/null

# ----- User configuration ----- #
# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Auto-start Hyprland on tty1 when zsh starts
if [[ -z $WAYLAND_DISPLAY && $XDG_VTNR -eq 1 ]]; then
    unset XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP DESKTOP_SESSION
    exec start-hyprland
fi

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

# Preferred editor for local and remote sessions
export EDITOR=nvim
export VISUAL=nvim

# enable core dumps
# ulimit -c unlimited

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
source $ZSH_CUSTOM/aliases.zsh
#$ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.


# eza is needed
#     `sudo packman -s eza`
