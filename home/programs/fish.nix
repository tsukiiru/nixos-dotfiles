{ ... }: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      if string match -qr '^/dev/pts' -- (tty);
        if not set -q TMUX
          exec tmux new-session -A -s main 
        end
      end

      set fish_greeting ""
      starship init fish | source
    '';

    shellAliases = {
      la = "eza -la --icons";
      ls = "eza --icons";
      nrs = "sudo nixos-rebuild switch --impure --flake ~/nixos-dotfiles#flake-btw";
      search = "nix search nixpkgs";
      live-server = "nix shell nixpkgs#python3 -c python3 -m http.server 8000 --directory";
    };
  };
}
