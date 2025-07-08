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

