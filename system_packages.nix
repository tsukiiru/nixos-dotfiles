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
  wezterm

  # networking
  wireguard-tools

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

  # fun stuff
  sqlite
  chameleos
]
