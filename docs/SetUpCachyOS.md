# CachyOS SetUp Guide

1. Download [Rofus](https://rufus.ie/es/)
    - Setup for `EFI`  
    - Disable `secure boot` in computer  

2. Intall [CachyOS](https://cachyos.org/)
   - Select `Lumine` as boot manager
   - Select `no` Desktop Environment (DE)
   - After instalation and first boot run:  
    `sudo pacman -Syu --needed`

3. Download nesesary things:
    ```bash
    sudo pacman -Syu --needed \
    hyprland uwsm plasma-login-manager xdg-desktop-portal-hyprland hyprpolkitagent cachy-update \
    hyprlock hyprpaper hyprcursor hyprshot hyprlauncher quickshell gnome-keyring\
    ghostty nvim tmux wl-clipboard mako yazi stow \
    brightnessctl wpctl playerctl \
    git curl wget unzip tar gzip \
    dolphin paru \
    ```  
    ```
    paru -Syu --neede \
    goole-chrome visual-studio-code-bin vesktop \
    ```

4. Set [SSH Key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
    - Generate ssh key:  
      `ssh-keygen -t ed25519 -C "your_email@example.com"`  
      find email: `setting > Emails`  
      path: `~/.ssh/github`
    - Start SSH agent:  
      `eval "$(ssh-agent -s)"`
    - Add key to agent:  
      `ssh-add ~/.ssh/github`  
    - Add key to github:
      `cat ~/.ssh/github.pub`  
      go to:
      `Setting > SSH and GPG keys > add SSH key` and copy preveus command output there

5. Clone [dotfiles](https://github.com/WicHoDev/.dotfiles)  
    - `git clone git@github.com:WicHoDev/.dotfiles.git`
