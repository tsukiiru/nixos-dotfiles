{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "dreamland";
    nameservers = [
      "1.1.1.1"
      "9.9.9.9"
    ]; # set dns to cloudflare & quad9
    networkmanager.enable = true;
  };

  # time.timeZone = "Europe/Amsterdam";

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  security.polkit.enable = true;

  services = {
    gnome.gnome-keyring.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    flatpak.enable = true;
    getty.autologinUser = "tsuki";
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
    tealdeer
    bat
    ghostty
    p7zip
    eza
    unzip
    rustup
    noctalia-shell
    tree
    ripgrep
    btop
    fastfetch
    wireguard-tools
    starship
    wine
    winetricks
  ];

  environment.variables = {
    EDITOR = "nvim";
  };

  programs = {
    niri.enable = true;
    fish.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    gamemode.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  users = {
    users.tsuki = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
    defaultUserShell = pkgs.fish;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "26.05";
}
