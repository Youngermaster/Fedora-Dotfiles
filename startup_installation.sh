# dnf config

sudo echo "

# Added for speed
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True
" >> /etc/dnf/dnf.conf

sudo dnf update -y

sudo dnf install vim neofetch keepassxc -y
