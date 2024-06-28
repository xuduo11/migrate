echo "update system and install packages"
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm zsh git neovim curl wget python gcc


echo "install Oh-My-Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "install Zsh plugins" 
git clone https://mirror.ghproxy.com/https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://mirror.ghproxy.com/https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "install autojump"
git clone https://mirror.ghproxy.com/https://github.com/wting/autojump.git ~/autojump
cd ~/autojump
./install.py

echo "copy zshrc" 
cp ~/my-configs/.zshrc ~/

echo "backup current nvim"
mv ~/.config/nvim{,.bak}

echo "install LazyVim"
git clone https://mirror.ghproxy.com/https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

echo "copy nvim config"
cp ~/my-configs/init.lua ~/.config/nvim/

echo "Setup complete! Please restart your terminal."
