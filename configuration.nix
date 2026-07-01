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

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "dreamland";

  networking.networkmanager.enable = true;

  # time.timeZone = "Europe/Amsterdam";

  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  security.polkit.enable = true;

  services.gnome.gnome-keyring.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.getty.autologinUser = "tsuki";

  environment.systemPackages = with pkgs; [
    git
    neovim
    tealdeer
    bat
    ghostty
    p7zip
    eza
    fish
    unzip
    rustup
    noctalia-shell
    tree
    ripgrep
    btop
    fastfetch
  ];

  environment.variables = {
    EDITOR = "nvim";
  };

  programs.niri = {
    enable = true;
  };

  programs.fish.enable = true;

  users.users.tsuki = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };
  users.defaultUserShell = pkgs.fish;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "26.05";
}
