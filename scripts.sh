# Things I definitely need in my dev enviroment
# ----------------------------------------------------
# nvim installation
pacman -S nvim
# nvm/node installation
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
nvm install --lts
# tmux / tmux sessionzer script / tpm
pacman -S tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# go installation maybe download the file and then install or make from source?
#  rm -rf /usr/local/go && tar -C /usr/local -xzf go1.24.5.linux-amd64.tar.gz
#
# install rofi / rofi wayland
# install waybar
pacman -S waybar
# set waybar config
pacman -S hyprpaper

# clone the wallpaper library
# git clone https://github.com/dharmx/walls.git
