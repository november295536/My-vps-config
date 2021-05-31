#!/bin/sh

#update apt
apt update
apt upgrade -y

#install git and curl
apt install git curl -y

#install zsh
apt install zsh powerline fonts-powerline -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd $ZSH_CUSTOM/themes
curl -O https://raw.githubusercontent.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme
cp bullet-train.zsh-theme ../themes

cd $ZSH_CUSTOM/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma/fast-syntax-highlighting $ZSH_CUSTOM/plugins/fast-syntax-highlighting
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_CUSTOM/plugins/autoupdate


cd ~
rm .zshrc
curl -O https://raw.githubusercontent.com/november295536/My-vps-config/master/.zshrc
chsh -s /bin/zsh
source ~/.zshrc

#copy firstboot file
cd ~
mkdir firstboot
cp /tmp/firstboot.exec ~/firstboot
cp /tmp/firstboot.log ~/firstboot
cd firstboot
chmod 744 firstboot.exec
