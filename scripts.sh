# Things I definitely need in my dev enviroment
# ----------------------------------------------------
# nvim installation
pacman -S nvim fzf tmux ttf-nerf-fonts-symbols vlc rofi pavucontrol swayimg 
# nvm/node installation
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install --lts
# tmux / tmux sessionzer script / tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# go installation maybe download the file and then install or make from source?
#  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.24.5.linux-amd64.tar.gz
#
# install rofi / rofi wayland
# install waybar
pacman -S waybar
# set waybar config
pacman -S hyprpaper

# setup vim command for nvim
sudo ln -sf /usr/bin/nvim /usr/local/bin/nvim

git clone https://aur.archlinux.org/yay.git
yay -S wlogout

pacman -S lm_sensors btop obs-studio kdenlive pulseeffects mpv rofi ttf-ubuntu-mono-nerdfzf

pacman -S grim slurp wl-clipboard

#yt dlp for downloading youtube videos and playing with mpv


# clone the wallpaper library
# git clone https://github.com/dharmx/walls.git
#
# obs setup
# yay install and install obs-studio-browser with yay
#
