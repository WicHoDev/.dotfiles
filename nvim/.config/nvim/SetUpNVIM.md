# Nvim-Config
Personal configuration of Nvim - - Its Public in case i lost acces to this account  =)

+ im  using the windows subsystem for linux WSL
+ do everything as the order that they appera
+ if you are not me who are seeing this repo, i dont know if this will work for you, I dont know how to help =)

## WSL
#### Install WSL
How to install [WSL](https://learn.microsoft.com/en-us/windows/wsl/install-manual)
`wsl --install` - In power shell run as admin <br>
#### If you what to Remove WSL
`wslconfig /l` - to see the distro that you have <br>
`wslconfig /u DistroName`  - to uninstall distro - where DistroName is the distro that you what to unistall <br>

## Install Nvim
+ install [nvim](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-source).
  - requirements (For Ubuntu)
    ```
    sudo apt-get install ninja-build gettext cmake unzip curl build-essential
    ```
  - Nvim:
    ```
      git clone https://github.com/neovim/neovim
      cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
      sudo make install
    ```

## configure terminal (linux)
+ install zsh - `sudo apt install zsh` <br>
+ change to zsh shell - `echo $0` --> `chsh` --> `/bin/zsh` --> `echo $0` <br>
  - reboot (close terminal if in linux)
  - chose option (2)
+ install 'oh my zsh' - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
  - if you installed nvim first you will have curl already
    - needs curl - `sudo apt install curl`
  - if in you are in WSL or linux you already have git
    - [git](https://git-scm.com/download/win)
+ install theme -powerlevel10k `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
  - add `powerlevel10k/powerlevel10k` theme to line `11` on `ZSH_THEME = "theme" `
  - needs [NERD font]((https://www.nerdfonts.com/font-downloads))

## Install Nvim Config Requisites
+ Needs [ripgrep](https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation) `sudo apt-get install ripgrep` <br>
+ Needed for LSP:
   - Install golang-go -- `sudo apt install golang-go`
+ if not already install, also get
  - [Git](https://git-scm.com/download/win) `sudo apt install git`
  - [Nerd Fonts](https://www.nerdfonts.com/font-downloads)

## SetUp nvim folder
+ download and move `nvim` folder from this repo to (linux)`~/.config`, so it look something like this `~/.config/nvim`, where `nvim` is the folder that you download
  - if you are not familiar with linux, and are using WSL. you can use `explorer.exe .` to open the fie explorer on the linux directory, 

### LSP Servers
+ Mason
  - c++  == Clangd

## other
* Need to change directory name on config `options.lua` line 31 (at this point)  where it says opt.undofile change directory to nvim folder.

[How to format README.md](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
