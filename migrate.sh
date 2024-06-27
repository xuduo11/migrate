# 更新系统和安装必要的软件包
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm zsh git neovim curl wget python gcc

# 安装 Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 安装 Zsh 插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 使用镜像网站安装 autojump
git clone https://mirror.ghproxy.com/https://github.com/wting/autojump.git ~/autojump
cd ~/autojump
./install.py

# 复制 zshrc 配置文件
cp ~/my-configs/.zshrc ~/

# 备份当前的 Neovim 配置文件
mv ~/.config/nvim{,.bak}

# 安装 LazyVim
git clone https://mirror.ghproxy.com/https://github.com/LazyVim/starter ~/.config/nvim

# 删除 LazyVim 仓库中的 .git 目录
rm -rf ~/.config/nvim/.git

# 复制 Neovim 配置文件
cp ~/my-configs/init.lua ~/.config/nvim/

echo "Setup complete! Please restart your terminal."
