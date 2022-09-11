# dnf config

sudo echo "

# Added for speed
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True
" >> /etc/dnf/dnf.conf

# Updating the packages
sudo dnf update -y

# Adding RPM fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core

# Install Media Codecs
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video -y

# Adding Flathub support
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# General stuff
sudo dnf install vim neofetch keepassxc gnome-tweaks gnome-extensions-app git cmake htop xrandr wget curl nmap ranger bat lsd discord flameshot discord google-chrome -y

# ZSH
sudo dnf install zsh zsh-syntax-highlighting zsh-autosuggestions -y
sudo usermod --shell /usr/bin/zsh $USER
sudo usermod --shell /usr/bin/zsh root

# Development stuff
sudo dnf install make automake gcc gcc-c++ kernel-devel -y
sudo dnf groupinstall "Development Tools" "Development Libraries" -y
## Python 3 and pip3
sudo dnf install python3 python3-venv python3-pip -y
## General packages for Python3
pip3 install matplotlib numpy matplotlib jupyterlab
## Rust programming language
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Multimedia stuff
sudo dnf install vlc kmod-v4l2loopback kdenlive -y

# Installing Nvidia Drivers
sudo dnf update --refresh -y
sudo dnf upgrade --refresh -y
sudo dnf install akmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda -y
sudo dnf install gcc kernel-headers kernel-devel akmod-nvidia xorg-x11-drv-nvidia xorg-x11-drv-nvidia-libs xorg-x11-drv-nvidia-libs.i686 -y

# Flathub based installations
flatpak install flathub org.wezfurlong.wezterm -y
