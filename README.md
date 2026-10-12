
```bash
# Initialize submodules (Neovim and Alacritty themes)
git submodule update --init --recursive

# clangd install
sudo apt install clangd-22
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-22 220

# symlinks
ln -s ~/dot-files/alacritty ~/.config/alacritty
ln -s ~/dot-files/nvim ~/.config/nvim
ln -s ~/dot-files/tmux ~/.config/tmux
```




