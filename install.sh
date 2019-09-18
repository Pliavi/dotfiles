#================#
# INSTALLATIONS  #
#================#
# Offical repo
sudo pamac install --no-confirm docker nodejs php yarn composer zsh mariadb

# AUR
sudo pamac build --no-confirm spotify wps-office oh-my-zsh-git micro discord visual-studio-code-bin zsh-theme-powerlevel10k-git

#===========#
#  DAEMONS  # 
#===========#
# Docker
sudo systemctl enable docker
sudo systemctl restart docker

#===========#
#  CONFIGS  #
#===========#
# ZSH
# NEWPATH=""
# if hash composer 2>/dev/null; then
#   NEWPATH="\$(composer global config home)/\$(composer global config bin-dir):"
# fi
# if hash yarn 2>/dev/null/; then
#   NEWPATH="\$(yarn global bin):"
# fi
# echo "export PATH=\"$NEWPATH\$PATH\"" >> ~/.zshrc

# After install p10k by AUR it has to link to custom themes
sudo ln -s /usr/share/zsh-theme-powerlevel10k $ZSH_CUSTOM/themes/powerlevel10k


# Docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R


