# RICEing Arch

### NerdFOnts
+ ShureTechMono 

## zsh
+ Install zsh - `pacman -S zsh`
  - config - `~/.zshrc`
+ Set as default - `chsh -s $(which zhs)`
+install oh-my-zsh - ''

+ ### Shell prompt
  - starship - `pacman -S starship`
  - setup shell:
    - add `eval "$(starship init zsh)"` to end of `.zshrc`
  - oh-my-zsh 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'

## Display/LogIn Manager
+ install lemurs - `pacman -S lemurs`
  - `sudo systemctl enable lemurs.service`
  - config - ``

## Terminal Emulator
+ Install Ghostty - `pacman -S ghostty`
  - config - `~/.config/ghostty/config`

## Window Manager
+ install Hyperland `pacman -S hypeland`
  - config `.config/hypr/hyprland.conf`
+ install brightness - `packman -S brightnessctl'
+ install playerCTL - `packman -S playerctl'
+ install wofi - `pacman -S wofi`
+ install waybar - `pacman -S waybar`
  - config `.config/waybar/config`
+ Change Terminal Emulator
  - in `.config/hypr/hyperland.conf`
    -change `$terminal = kitty` to `$terminal = ghostty`

## Config Files Tree view
```
.config/
 |-> ghostty/
 |   |-> conf
 |-> hypr/
 |   |-> hyprland.conf
 |-> nvim/
 |-> waybar/
 |   |-> config
 |-> starship.toml
 .gitconfig
 .tmux-config
 .zshrc
```

## STOW config
+ Install Stow `pacman -S stow`
  - use 
    `stow root`
    `stow hypr`
    `stow waybar`
    `stow nvim`
    `stow ghostty`

Tree view
```
.dotfiles/
 |-> root/
 |   |-> .gitconfig
 |   |-> .tmux-config
 |   |-> .zshrc
 |
 |-> ghostty
 |   |-> .config/
 |   |   |-> ghostty/
 |   |   |   |-> conf
 |
 |-> hypr
 |   |-> .config/
 |   |   |-> hypr/
 |   |   |   |-> hyprland.conf
 |
 |-> waybar
 |   |-> .config/
 |   |   |-> waybar/
 |   |   |   |-> config
 |
 |-> starship
 |   |-> .config/
 |   |   |-> starship.toml
```
