{ ... }: {
  i18n.inputMethod.fcitx5 = {
    settings = {
      inputMethod = {
        GroupOrder."0" = "Default";
        "Groups/0" = {
          Name = "Default";
          "Default Layout" = "us";
          DefaultIM = "keyboard-us";
        };
        "Groups/0/Items/0".Name = "keyboard-us";
        "Groups/0/Items/1".Name = "mozc";
        "Groups/0/Items/2".Name = "unikey";
      };
      globalOptions = {
        ActiveByDefault = true;
      };
    };
    ignoreUserConfig = true;
  };
}
