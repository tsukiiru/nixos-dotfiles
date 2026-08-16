{ ... }: {
  file = {
    ".config/nvim".source = ./nvim;
    ".config/niri".source = ./niri;
    ".config/wezterm".source = ./wezterm;
    ".config/Wallpapers".source = ./Wallpapers;
    ".config/fastfetch".source = ./fastfetch;
    ".config/alacritty".source = ./alacritty;
    # ".tmux.conf".source = ./.tmux.conf;
    ".face".source = ./.face;
  };
}
