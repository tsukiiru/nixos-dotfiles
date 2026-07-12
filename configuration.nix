{
  config,
  lib,
  pkgs,
  ...
}:
let
  sys_pkgs = import ./system_packages.nix pkgs;
in
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

  time.timeZone = "Asia/Ho_Chi_Minh";

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

  environment = {
    systemPackages = sys_pkgs;
    variables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    niri.enable = true;
    fish.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stylua
        rust-analyzer
      ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  users = {
    users.tsuki = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
    defaultUserShell = pkgs.fish;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "26.05";
}
