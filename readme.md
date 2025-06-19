# Link files to their designated areas

## installing stow to create symlinks
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

```
ln -s ~/.DOTFILES/.zshrc ~/.zshrc
ln -s ~/.DOTFILES/.gitconfig ~/.gitconfig
ln -s ~/.DOTFILES/nvim/ ~/.config/
ln -s ~/.DOTFILES/i3/ ~/.config/
ln -s ~/.DOTFILES/.tmux.conf ~/.tmux.conf
```

# Todo
add a hombrew files to automatically intslla all the programs i need<br/>
Or fined another way to use do it<br/>

[Nvim Config](nvim/SetUpNVIM.md)

