{ }: {
  enable = true;
  interactiveShellInit = ''
    set fish_greeting ""
  '';

  shellAliases = {
    la = "eza -la --icons";
    ls = "eza --icons";
    nrs = "sudo nixos-rebuild switch --impure --flake ~/nixos-dotfiles#flake-btw";
    live-server = "nix shell nixpkgs#python3 -c python3 -m http.server 8000 --directory";
  };
}
