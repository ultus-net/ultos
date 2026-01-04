#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

###############################################################################
# Example: Installing 1Password and Google Chrome from Official Repositories
###############################################################################
# This is an EXAMPLE file showing how to add third-party RPM repositories
# and install packages from them following Universal Blue/Bluefin conventions.
#
# To use this script:
# 1. Rename this file to remove the .example extension: 20-onepassword.sh
# 2. The build system will automatically run scripts in numerical order
#
# IMPORTANT CONVENTIONS (from @ublue-os/bluefin):
# - Always clean up temporary repository files after installation
# - Use dnf5 exclusively (never dnf or yum)
# - Always use -y flag for non-interactive operations
# - Remove repo files to keep the image clean (repos don't work at runtime)
###############################################################################

### Install curated packages (Fedora/Universal Blue)

echo "Installing curated packages..."

# Use dnf5 per convention
set -oue pipefail

# Read package list inline; skip any that aren’t available on this base
readarray -t PACKAGES << 'EOF'
ptyxis
bash-completion
bat
bolt
brightnessctl
btop
btrfs-progs
clang
cmatrix
corectrl
cups
cups-browsed
cups-filters
cups-pdf
direnv
distrobox
dust
efibootmgr
egl-wayland
evince
exfatprogs
eza
fastfetch
fcitx5
fcitx5-gtk
fcitx5-qt
fd-find
ffmpegthumbnailer
firefox
fish
flatpak
fontconfig
freerdp
fzf
gamemode
gamescope
gh
git
golang
grim
gstreamer1-plugin-pipewire
gvfs-mtp
gvfs-nfs
gvfs-smb
ImageMagick
imv
inetutils
inxi
iwd
jq
just
kdenlive
kvantum
lazygit
less
linux-firmware
llvm
luarocks
lutris
mako
man-db
mangohud
mono
mpv
nano
nautilus
nmap-ncat
nodejs
nss-mdns
obs-studio
pamixer
patchelf
pinta
pipewire
pipewire-alsa
pipewire-jack-audio-connection-kit
pipewire-pulseaudio
pipx
playerctl
plocate
plymouth
podman
podman-compose
polkit-gnome
power-profiles-daemon
python3-gobject
python3-pip
qt5-qtwayland
qt6-qtwayland
rclone
ripgrep
ruby
rust
slurp
snapper
starship
steam
sunshine
system-config-printer
systemd-zram-generator
tealdeer
ufw
unzip
vkbasalt
whois
wine
wireless-regdb
wireplumber
wl-clipboard
xdg-desktop-portal-gtk
xmlstarlet
xournalpp
yq
zoxide
zsh
EOF

# Install, skipping anything that isn’t available on this base
dnf5 install -y --skip-unavailable "${PACKAGES[@]}"

echo "Curated packages installation complete."
