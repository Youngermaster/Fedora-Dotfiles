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
sudo dnf install vim neofetch keepassxc gnome-tweaks gnome-extensions-app git cmake htop wget curl nmap ranger -y

# Development stuff
sudo dnf install make automake gcc gcc-c++ kernel-devel -y
sudo dnf groupinstall "Development Tools" "Development Libraries" -y

# Multimedia stuff
sudo dnf install vlc -y
