{
  pkgs,
  config,
  lib,
  ...
}:
let
  sys_pkgs = import ./system_packages.nix pkgs;
  milk = pkgs.fetchFromGitHub {
    owner = "tsukiiru";
    repo = "MilkGrub";
    rev = "28644023f74e4830d97ef3a551714fe6c984f02b";
    sha256 = "0a3ap455sl0npch5jh51gqc18fj7d97r5xqrqlj29v56sm4k8cvj";
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "aseprite"
      "steam"
      "steam-unwrapped"
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-kernel-modules"
    ];
  nixpkgs.config.nvidia.acceptLicense = true;

  boot = {
    kernelParams = [
      "nvidia-drm.modeset=1"
      "nvidia-drm.fbdev=1"
    ];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        devices = [ "nodev" ];
        useOSProber = true;
        theme = milk;
      };
    };
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
    xserver.videoDrivers = [ "nvidia" ];
  };

  environment = {
    systemPackages = sys_pkgs;
    variables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        curl
      ];
    };
    niri.enable = true;
    bash.interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
    fish.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  xdg.portal.enable = true;

  users = {
    users.tsuki = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "video"
        "render"
      ];
    };
    # defaultUserShell = pkgs.fish;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.legacy_535;
      powerManagement.enable = false;
      nvidiaSettings = true;
    };

  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "26.05";
}
