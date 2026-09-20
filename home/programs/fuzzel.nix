{ ... }: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Monofur Nerd Font:size=12";
        lines = 10;
        auto-select = true;
      };
    };
  };
}
