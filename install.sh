#================#
# INSTALLATIONS  #
#================#
# Offical repo
yes | pamac install code docker steam nodejs php yarn composer ruby zsh htop playerctl

# AUR
yes | pamac build polybar spotify wps-office oh-my-zsh-git micro ulauncher google-chrome

#===========#
#  DAEMONS  # 
#===========#
# Docker
sudo systemctl enable docker
sudo systemctl restart docker

#===========#
#  CONFIGS  #
#===========#
# Docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R

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
