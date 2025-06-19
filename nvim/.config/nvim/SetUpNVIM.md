# Nvim-Config
Personal configuration of Nvim - - Its Public in case i lost acces to this account  =)

+ im  using the windows subsystem for linux WSL
+ do everything as the order that they appera
+ if you are not me who are seeing this repo, i dont know if this will work for you, I dont know how to help =)

## WSL
#### Install WSL
How to install [WSL](https://learn.microsoft.com/en-us/windows/wsl/install-manual)
```
wsl --install # In power shell run as admin
```
#### If you what to Remove WSL
```
wslconfig /l                # to see the distro that you have
wslconfig /u <DistroName>   # to uninstall distro - where DistroName is the distro that you what to unistall
```

## Install Nvim
+ install [nvim](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-source).
  - requirements (For Ubuntu)
    ```
    sudo apt-get install ninja-build gettext cmake unzip curl git build-essential
    ```
  - Nvim:
    ```
      git clone https://github.com/neovim/neovim     # clone repo
      cd neovim
      git checkout stable                            # for the latest stable version
      make CMAKE_BUILD_TYPE=Release
      sudo make install

      #verify instalation
      nvim --version
    ```
  + ### Unistall Nvim
    - remove configuration
    ```
    rm -rf ~/.config/nvim
    rm -rf ~/.local/share/nvim
    rm -rf ~/.cache/nvim
    ```
    - remove installation

    ```
    sudo rm -rf /usr/local/bin/nvim
    sudo rm -rf /usr/local/share/nvim
    
    # Optional
    sudo rm -rf /usr/local/lib/nvim
    sudo rm -rf /usr/local/include/nvim
    sudo rm -rf /usr/local/man/man1/nvim.1
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
    - needs curl - ```sudo apt install curl```
  - if in you are in WSL or linux you already have git
    - [git](https://git-scm.com/download/win)
+ install theme -powerlevel10k ```git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k```
  - add ```powerlevel10k/powerlevel10k``` theme to line `11` on `ZSH_THEME = "theme" `
  - needs [NERD font]((https://www.nerdfonts.com/font-downloads))

## Nvim Config Requisites
+ For LSP
  - [ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation) ```sudo apt install ripgrep fd-find``` <br>
  - Install golang-go -- ```sudo apt install golang-go```
+ For Treesitter
  - ```sudo apt install gcc g++ make build-essential```
+ Lua Plugins
  -```sudo apt install luarocks``` 
+ install lazygit
  - ```sudo apt install lazygit```
+ For Noice
  -```sudo apt install libnotify-bin```
+ if not already install, also get
  - [Git](https://git-scm.com/download/win) ```sudo apt install git```
  - [Nerd Fonts](https://www.nerdfonts.com/font-downloads)


### LSP Servers
+ Mason
  - c++  == Clangd

[How to format README.md](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
