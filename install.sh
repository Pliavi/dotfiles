#================#
# INSTALLATIONS  #
#================#
# Offical repo
sudo pamac remove --no-confirm firefox
sudo pamac install --no-confirm yarn zsh micro discord code-oss chromium gimp kdenlive yarn ttf-jetbrains-mono ttf-cascadia-code
sudo pamac reinstall noto-fonts-emoji
sudo fc-cache -f
fc-cache -f

# AUR
sudo pamac build --no-confirm spotify-adblock prezto-git insomnia ngrok
# Took too much time (instalações demoradas)
sudo pamac build --no-confirm aseprite

# OBS Installation (With BrowserSource)
#===========#
#  DAEMONS  # 
#===========#

#===========#
#  CONFIGS  #
#===========#

