# Link files to their designated areas

## Using stow
Install stow
```
sudo apt install stow
```
use the following to create symslink
```
stow i3     # for i3 config     ~/.config/i3
stow nvim   # for nvim config   ~/.config/nvim
stow root   # for zshrc, git and tmux config    ~/.config/.zshrc
                                                ~/.config/.gitconfig
                                                ~/.config/.tmux.conf
```

## configure terminal (linux)
+ install zsh ```sudo apt install zsh``` <br>
+ change to zsh shell
  ```
  echo $0
  chsh
  /bin/zsh
  echo $0
  ```
  - reboot (close terminal if in linux)
  - chose option (2)
+ install 'oh my zsh' - ```sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ```
  - if you installed nvim first you will have curl already
    - ```sudo apt install curl```
  - if in you are in WSL or linux you already have git
    - [git](https://git-scm.com/download/win)
+ install theme -powerlevel10k ```git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k```
  - add ```powerlevel10k/powerlevel10k``` theme to line `11` on `ZSH_THEME = "theme" `
  - needs [NERD font]((https://www.nerdfonts.com/font-downloads))


# [Nvim Config](nvim/.config/nvim/SetUpNVIM.md)

