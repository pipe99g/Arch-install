#laptop packages (bluetooth, acpi, wifi, etc.)
#falta hacer un checkbox que especifique que estos packages son para laptop
cd
sudo pacman -S acpi acpi_call tlp bluez bluez-utils

systemctl enable bluetooth.service
systemctl enable tlp

#enabling multilib
/etc/pacman.conf

sudo echo '[multilib]' >> /etc/pacman.conf
sudo echo '/etc/pacman.d/mirrorlist' >> /etc/pacman.conf
sudo pacman -Sy

#arch repository packages
sudo pacman -S $(cat ~/Arch-install/pacmanpackages.txt)


#YAY installation. NINGUN PAQUETE AUR QUEDÓ INSTALADO CORRECTAMENTE
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

yay -S $(cat ~/Arch-install/aurpackages.txt)

#flatpaks
flatpak install flathub com.spotify.Client

# vim packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

#pipewire setup
#systemctl --user daemon-reload
#systemctl --user --now disable pulseaudio.service pulseaudio.socket


#oh my zsh
cd
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#oh my zsh plugins
cd ~/.oh-my-zsh/plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#icons in terminal
cd ~/Downloads/
git clone https://github.com/sebastiencs/icons-in-terminal.git
cd icons-in-terminal/
./install.sh

#ranger plugins
 #ranger icons
cd .config/ranger/plugins/
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

cd
git clone https://github.com/pipe99g/dotfiles
bash stow.sh


#El siguiente comando es redundante porque ohmyzsh pregunta si quiero hacer a zsh el shell predeterminado 
#chsh -s $(which zsh)

#enable services 
sudo systemctl enable ntpd
systemctl --user enable pipewire pipewire-pulse
systemctl enable sshd
