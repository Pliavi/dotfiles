#================#
# INSTALLATIONS  #
#================#
# Offical repo
yes | pamac install code mpd mpc docker steam nodejs php yarn composer ruby zsh htop

# AUR
yes | pamac build polybar spotify wps-office oh-my-zsh-git micro ulauncher

#===========#
#  DAEMONS  # 
#===========#
# MPD
sudo systemctl enable mpd
sudo systemctl restart mpd

# Docker
sudo systemctl enable docker
sudo systemctl restart docker

# VSCode - Install extensions
PL_extensions=()
PL_extensions+=("PKief.material-icon-theme")
PL_extensions+=("Equinusocio.vsc-material-theme")
PL_extensions+=("Zignd.html-css-class-completion")
PL_extensions+=("robinbentley.sass-indented")
PL_extensions+=("karunamurti.haml")
PL_extensions+=("PeterJausovec.vscode-docker")
for PL_ext in ${PL_extensions[*]}; do
    code --install-extension $PL_ext
done

#===========#
#  CONFIGS  #
#===========#
# Docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
