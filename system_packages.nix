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
  wget
  jq
  nodejs_22
  croc

  # tui
  btop
  nix-tree
  yazi
  neovim

  # archive
  p7zip
  unzip

  # terminal
  alacritty
  tmux

  # networking
  wireguard-tools

  # wine
  wineWow64Packages.stable
  winetricks
  libstrangle

  # media
  imagemagick
  imv
  gimp
  #aseprite
  blender
  ffmpeg
  yt-dlp
  vlc
  zathura

  # study
  anki

  # fonts
  nerd-fonts.monofur

  # fun stuff
  sqlite
  xwayland-satellite
  goog # goog...
  fuzzel
  cbonsai # tree!!!
  evtest
  cinny-desktop
]
