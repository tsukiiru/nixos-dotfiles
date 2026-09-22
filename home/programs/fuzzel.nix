{ ... }: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Monofur Nerd Font:size=14";
        lines = 15;
        auto-select = true;
        namespace = "fuzzel";
      };
      colors = {
        background = "#11121d90";
        text = "#A0A8CD60";
        selection-match = "#282C3490";
        match = "#A2D6F9ff";
        selection = "#282C3490";
        selection-text = "#F5F5F5FF";
      };
      border = {
        width = 0;
      };
    };
  };
}
