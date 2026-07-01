{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.username = "tsuki";
  home.homeDirectory = "/home/tsuki";
  home.stateVersion = "25.05";

  imports = [
    inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting ""
    '';

    shellAliases = {
      la = "eza -l --icons";
      ls = "eza --icons";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#flake-btw";
    };
  };

  home.file.".config/nvim".source = ./config/nvim;
  home.file.".config/niri".source = ./config/niri;
  home.file.".config/ghostty".source = ./config/ghostty;
  home.file.".config/Wallpapers".source = ./config/Wallpapers;
  home.file.".config/fastfetch".source = ./config/fastfetch;
  home.file.".config/noctalia" = {
    source = ./config/noctalia;
    recursive = true;
  };
}
