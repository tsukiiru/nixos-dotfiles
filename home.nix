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
    inputs.nixcord.homeModules.nixcord
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
      nrs = "sudo nixos-rebuild switch --impure --flake ~/nixos-dotfiles#flake-btw";
    };
  };

  programs.nixcord = {
    enable = true;
    discord.equicord.enable = true;

    config = {
      themeLinks = [
        "https://raw.githubusercontent.com/tsukiiru/quickCSS-discord/refs/heads/main/file.css"
        "https://raw.githubusercontent.com/tsukiiru/quickCSS-discord/refs/heads/main/solar.css"
        "https://raw.githubusercontent.com/tsukiiru/quickCSS-discord/refs/heads/main/moreicons.css"
      ];
      frameless = true;

      plugins = {
        betterGifPicker.enable = true;
        crashHandler.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        iLoveSpam.enable = true;
        implicitRelationships.enable = true;
        ircColors = {
          enable = true;
          lightness = 80;
        };
        mentionAvatars.enable = true;
        messageLogger.enable = true;
        noBlockedMessages.enable = true;
        noF1.enable = true;
        noTypingAnimation.enable = true;
        plainFolderIcon.enable = true;
        quickReply.enable = true;
        reviewDb.enable = true;
        serverInfo.enable = true;
        shikiCodeblocks.enable = true;
        showConnections.enable = true;
        showHiddenChannels.enable = true;
        showTimeoutDuration.enable = true;
        silentTyping.enable = true;
        whoReacted.enable = true;
        bannersEverywhere = {
          enable = true;
          animate = true;
        };
        clickableRoles.enable = true;
        declutter = {
          enable = true;
          removeAvatarDecoration = false;
          removeNameplate = false;
          removeProfileEffect = false;
          removeClanTag = false;
        };
        fixFileExtensions.enable = true;
        fullVcpfp.enable = true;
        ghosted.enable = true;
        gifCollections.enable = true;
        gitHubRepos.enable = true;
        noNitroUpsell.enable = true;
        pinIcon.enable = true;
        questify = {
          enable = true;
          autoCompleteQuestTypes.PLAY_ON_DESKTOP = true;
        };
        soggy.enable = true;
        betterGifLoad.enable = true;
      };
    };
  };

  home.file.".config/nvim".source = ./config/nvim;
  home.file.".config/niri".source = ./config/niri;
  home.file.".config/ghostty".source = ./config/ghostty;
  home.file.".config/Wallpapers".source = ./config/Wallpapers;
  home.file.".config/fastfetch".source = ./config/fastfetch;
  home.file.".config/noctalia".source = ./config/noctalia;
}
