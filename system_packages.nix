{ pkgs, ... }: with pkgs;
[
  # cli
  git
  tealdeer
  bat
  eza
  tree
  ripgrep
  fd
  fastfetch
  fontconfig

  # tui
  btop
  nix-tree
  yazi
  neovim

  # archive
  p7zip
  unzip

  # terminal
  starship
  wezterm

  # networking
  wireguard-tools
  ngrok

  # wayland / portals
  noctalia-shell
  xwayland-satellite
  xdg-desktop-portal-gnome
  xdg-desktop-portal-gtk
  xdg-desktop-portal-wlr

  # wine
  wineWow64Packages.stable
  winetricks
  libstrangle

  # graphics
  intel-media-driver
  vpl-gpu-rt

  # media
  imagemagick
  imv
  gimp
  aseprite
  blender
  ffmpeg
  yt-dlp
  vlc
]
