{ }: {
  enable = true;
  discord.equicord.enable = true;

  quickCss = ''
    @import url("https://raw.githubusercontent.com/tsukiiru/quickCSS-discord/refs/heads/main/solar.css");
    @import url("https://raw.githubusercontent.com/tsukiiru/quickCSS-discord/refs/heads/main/moreicons.css");
    @import url("https://raw.githubusercontent.com/tsukiiru/quickCSS-discord/refs/heads/main/file.css");
        
    :root,
    .theme-dark {
      --window-tint: #0005;
      --theme-background-image: url("https://github.com/tsukiiru/quickCSS-discord/blob/main/Girls-Last-Tour-3.webp?raw=true");
      --enable-blur: 1;
      --blur-strength: 6px;
      --custom-app-top-bar-height: 12px;
    }

    body {
      /*letter-spacing: -0.02ch;*/
      --font-primary: "CozetteVector";
      --font-display: "CozetteVector";
      --font-code: "CozetteVector";
      /* css doesnt like bitmap fonts ;-; */
    }

  '';

  config = {
    useQuickCss = true;
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

}
