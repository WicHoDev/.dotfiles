source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# config.fish: owns the shell environment
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

if not ssh-add -l >/dev/null 2>&1
    ssh-add ~/.ssh/github
end

if not set -q TMUX
    tmux has-session -t Dev 2>/dev/null; or tmux new-session -d -s main
end

# Enable the full informative git prompt status
set -g __fish_git_prompt_show_informative_status 1

# Show markers for dirty, staged, untracked, and stashed files
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showstashstate 1
set -g __fish_git_prompt_showupstream auto

# Optional: Enable colors for the indicators
set -g __fish_git_prompt_showcolorhints 1
