{ inputs, config, ... }:
let
  homeDir = config.home.homeDirectory;
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;

    colors = {
      mPrimary = "#c4b28a";
      mOnPrimary = "#1F1F28";
      mSecondary = "#8ea49e";
      mOnSecondary = "#1F1F28";
      mTertiary = "#938AA9";
      mOnTertiary = "#1F1F28";
      mError = "#c4746e";
      mOnError = "#1F1F28";
      mSurface = "#1F1F28";
      mOnSurface = "#DCD7BA";
      mSurfaceVariant = "#2A2A37";
      mOnSurfaceVariant = "#C8C093";
      mOutline = "#435965";
      mShadow = "#000000";
      mHover = "#363646";
      mOnHover = "#DCD7BA";
    };

    # i have no idea why non-official plugins need those id
    plugins = {
      autoUpdate = false;
      notifyUpdates = false;
      sources = [
        {
          enabled = true;
          name = "official noctalia plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
        {
          enabled = true;
          name = "tsuki's noctalia plugins";
          url = "https://github.com/tsukiiru/noctalia-plugins";
        }
      ];
      states = {
        "kaomoji-provider" = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        "privacy-indicator" = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        "77d43d:bongo-cat" = {
          enabled = true;
          sourceUrl = "https://github.com/tsukiiru/noctalia-plugins";
        };
      };
    };

    settings = {
      settingsVersion = 59;
      bar = {
        barType = "floating";
        position = "bottom";
        monitors = [ ];
        density = "comfortable";
        showOutline = false;
        showCapsule = false;
        capsuleOpacity = 1;
        capsuleColorKey = "none";
        widgetSpacing = 2;
        contentPadding = 2;
        fontScale = 1;
        enableExclusionZoneInset = true;
        backgroundOpacity = 0.75;
        useSeparateOpacity = false;
        marginVertical = 11;
        marginHorizontal = 265;
        frameThickness = 8;
        frameRadius = 12;
        outerCorners = false;
        hideOnOverview = false;
        displayMode = "always_visible";
        autoHideDelay = 500;
        autoShowDelay = 150;
        showOnWorkspaceSwitch = true;
        widgets = {
          left = [
            {
              colorizeSystemIcon = "none";
              colorizeSystemText = "none";
              customIconPath = "";
              enableColorization = false;
              icon = "rocket";
              iconColor = "none";
              id = "Launcher";
              useDistroLogo = false;
            }
            {
              characterCount = 4;
              colorizeIcons = false;
              emptyColor = "none";
              enableScrollWheel = false;
              focusedColor = "secondary";
              followFocusedScreen = false;
              fontWeight = "regular";
              groupedBorderOpacity = 1;
              hideUnoccupied = false;
              iconScale = 0.8;
              id = "Workspace";
              labelMode = "none";
              occupiedColor = "primary";
              pillSize = 0.5;
              showApplications = false;
              showApplicationsHover = false;
              showBadge = false;
              showLabelsOnlyWhenOccupied = false;
              unfocusedIconsOpacity = 1;
            }
            {
              compactMode = false;
              hideMode = "hidden";
              hideWhenIdle = false;
              id = "MediaMini";
              maxWidth = 250;
              panelShowAlbumArt = true;
              scrollingMode = "hover";
              showAlbumArt = true;
              showArtistFirst = true;
              showProgressRing = true;
              showVisualizer = false;
              textColor = "none";
              useFixedWidth = false;
              visualizerType = "wave";
            }
          ];
          center = [
            {
              clockColor = "none";
              customFont = "Adwaita Mono";
              formatHorizontal = "HH:mm\\nddd, MMMM dd";
              formatVertical = "HH mm - dd MM";
              id = "Clock";
              tooltipFormat = "HH:mm ddd, MMM dd";
              useCustomFont = false;
            }
            {
              id = "plugin:77d43d:bongo-cat";
            }
          ];
          right = [
            {
              defaultSettings = {
                activeColor = "primary";
                enableToast = true;
                hideInactive = true;
                iconSpacing = 4;
                inactiveColor = "none";
                removeMargins = false;
              };
              id = "plugin:privacy-indicator";
            }
            {
              compactMode = true;
              diskPath = "/";
              iconColor = "none";
              id = "SystemMonitor";
              showCpuCores = false;
              showCpuFreq = false;
              showCpuTemp = false;
              showCpuUsage = true;
              showDiskAvailable = false;
              showDiskUsage = false;
              showDiskUsageAsPercent = false;
              showGpuTemp = false;
              showLoadAverage = false;
              showMemoryAsPercent = true;
              showMemoryUsage = true;
              showNetworkStats = false;
              showSwapUsage = false;
              textColor = "none";
              useMonospaceFont = true;
              usePadding = false;
            }
            {
              blacklist = [ ];
              chevronColor = "none";
              colorizeIcons = true;
              drawerEnabled = true;
              hidePassive = true;
              id = "Tray";
              pinned = [
                "Unikey"
              ];
            }
            {
              hideWhenZero = false;
              hideWhenZeroUnread = false;
              iconColor = "none";
              id = "NotificationHistory";
              showUnreadBadge = true;
              unreadBadgeColor = "primary";
            }
            {
              displayMode = "onhover";
              iconColor = "none";
              id = "Volume";
              middleClickCommand = "pwvucontrol || pavucontrol";
              textColor = "none";
            }
            {
              applyToAllMonitors = false;
              displayMode = "onhover";
              iconColor = "none";
              id = "Brightness";
              textColor = "none";
            }
          ];
        };
        mouseWheelAction = "none";
        reverseScroll = false;
        mouseWheelWrap = true;
        middleClickAction = "none";
        middleClickFollowMouse = false;
        middleClickCommand = "";
        rightClickAction = "controlCenter";
        rightClickFollowMouse = true;
        rightClickCommand = "";
        screenOverrides = [ ];
      };
      general = {
        avatarImage = "${homeDir}/.face";
        dimmerOpacity = 0.2;
        showScreenCorners = false;
        forceBlackScreenCorners = false;
        scaleRatio = 0.8;
        radiusRatio = 0.6;
        iRadiusRatio = 0.6;
        boxRadiusRatio = 1;
        screenRadiusRatio = 1;
        animationSpeed = 1.8;
        animationDisabled = false;
        compactLockScreen = false;
        lockScreenAnimations = false;
        lockOnSuspend = true;
        showSessionButtonsOnLockScreen = true;
        showHibernateOnLockScreen = false;
        enableLockScreenMediaControls = false;
        enableShadows = true;
        enableBlurBehind = false;
        shadowDirection = "bottom_right";
        shadowOffsetX = 2;
        shadowOffsetY = 3;
        language = "en";
        allowPanelsOnScreenWithoutBar = true;
        showChangelogOnStartup = true;
        telemetryEnabled = false;
        enableLockScreenCountdown = true;
        lockScreenCountdownDuration = 5000;
        autoStartAuth = false;
        allowPasswordWithFprintd = false;
        clockStyle = "custom";
        clockFormat = "hh
mm";
        passwordChars = false;
        lockScreenMonitors = [ ];
        lockScreenBlur = 0;
        lockScreenTint = 0;
        keybinds = {
          keyUp = [
            "Up"
          ];
          keyDown = [
            "Down"
          ];
          keyLeft = [
            "Left"
          ];
          keyRight = [
            "Right"
          ];
          keyEnter = [
            "Return"
            "Enter"
          ];
          keyEscape = [
            "Esc"
          ];
          keyRemove = [
            "Del"
          ];
        };
        reverseScroll = false;
        smoothScrollEnabled = true;
      };
      ui = {
        fontDefault = "Monofur Nerd Font";
        fontFixed = "Monofur Nerd Font";
        fontDefaultScale = 0.92;
        fontFixedScale = 0.9;
        tooltipsEnabled = true;
        scrollbarAlwaysVisible = false;
        boxBorderEnabled = false;
        panelBackgroundOpacity = 1;
        translucentWidgets = false;
        panelsAttachedToBar = true;
        settingsPanelMode = "centered";
        settingsPanelSideBarCardStyle = false;
      };
      location = {
        name = "Hanoi";
        weatherEnabled = true;
        weatherShowEffects = true;
        weatherTaliaMascotAlways = false;
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
        showCalendarEvents = true;
        showCalendarWeather = true;
        analogClockInCalendar = false;
        firstDayOfWeek = -1;
        hideWeatherTimezone = false;
        hideWeatherCityName = false;
        autoLocate = true;
      };
      calendar = {
        cards = [
          {
            enabled = true;
            id = "calendar-header-card";
          }
          {
            enabled = true;
            id = "calendar-month-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
        ];
      };
      wallpaper = {
        enabled = true;
        overviewEnabled = false;
        directory = "${homeDir}/.config/Wallpapers";
        monitorDirectories = [
          {
            directory = "${homeDir}/.config/Wallpapers";
            name = "eDP-1";
            wallpaper = "";
          }
        ];
        enableMultiMonitorDirectories = false;
        showHiddenFiles = true;
        viewMode = "browse";
        setWallpaperOnAllMonitors = true;
        linkLightAndDarkWallpapers = true;
        fillMode = "crop";
        fillColor = "#000000";
        useSolidColor = false;
        solidColor = "#1a1a2e";
        automationEnabled = false;
        wallpaperChangeMode = "random";
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = [
          "disc"
          "stripes"
        ];
        skipStartupTransition = false;
        transitionEdgeSmoothness = 0.05;
        panelPosition = "center";
        hideWallpaperFilenames = true;
        useOriginalImages = false;
        overviewBlur = 0.4;
        overviewTint = 0.6;
        useWallhaven = false;
        wallhavenQuery = "";
        wallhavenSorting = "relevance";
        wallhavenOrder = "desc";
        wallhavenCategories = "111";
        wallhavenPurity = "100";
        wallhavenRatios = "";
        wallhavenApiKey = "";
        wallhavenResolutionMode = "atleast";
        wallhavenResolutionWidth = "";
        wallhavenResolutionHeight = "";
        sortOrder = "name";
        favorites = [ ];
      };
      appLauncher = {
        enableClipboardHistory = true;
        autoPasteClipboard = false;
        enableClipPreview = true;
        clipboardWrapText = true;
        enableClipboardSmartIcons = true;
        enableClipboardChips = true;
        clipboardWatchTextCommand = "wl-paste --type text --watch cliphist store";
        clipboardWatchImageCommand = "wl-paste --type image --watch cliphist store";
        position = "center";
        pinnedApps = [ ];
        sortByMostUsed = true;
        terminalCommand = "wezterm -e";
        customLaunchPrefixEnabled = false;
        customLaunchPrefix = "";
        viewMode = "list";
        showCategories = false;
        iconMode = "tabler";
        showIconBackground = false;
        enableSettingsSearch = false;
        enableWindowsSearch = false;
        enableSessionSearch = false;
        ignoreMouseInput = true;
        screenshotAnnotationTool = "";
        overviewLayer = false;
        density = "default";
      };
      controlCenter = {
        position = "bottom_center";
        diskPath = "/";
        shortcuts = {
          left = [
            {
              id = "Network";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "NoctaliaPerformance";
            }
            {
              id = "PowerProfile";
            }
          ];
          right = [ ];
        };
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = false;
            id = "audio-card";
          }
          {
            enabled = false;
            id = "brightness-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = false;
            id = "media-sysmon-card";
          }
        ];
      };
      systemMonitor = {
        cpuWarningThreshold = 80;
        cpuCriticalThreshold = 90;
        tempWarningThreshold = 80;
        tempCriticalThreshold = 90;
        gpuWarningThreshold = 80;
        gpuCriticalThreshold = 90;
        memWarningThreshold = 80;
        memCriticalThreshold = 90;
        swapWarningThreshold = 80;
        swapCriticalThreshold = 90;
        diskWarningThreshold = 80;
        diskCriticalThreshold = 90;
        diskAvailWarningThreshold = 20;
        diskAvailCriticalThreshold = 10;
        batteryWarningThreshold = 20;
        batteryCriticalThreshold = 5;
        enableDgpuMonitoring = false;
        useCustomColors = false;
        warningColor = "";
        criticalColor = "";
        externalMonitor = "resources || missioncenter || jdsystemmonitor || corestats || system-monitoring-center || gnome-system-monitor || plasma-systemmonitor || mate-system-monitor || ukui-system-monitor || deepin-system-monitor || pantheon-system-monitor";
      };
      noctaliaPerformance = {
        disableWallpaper = false;
        disableDesktopWidgets = true;
      };
      dock = {
        enabled = false;
        position = "bottom";
        displayMode = "always_visible";
        dockType = "floating";
        backgroundOpacity = 1;
        floatingRatio = 1;
        size = 1;
        onlySameOutput = true;
        monitors = [ ];
        pinnedApps = [ ];
        colorizeIcons = false;
        showLauncherIcon = false;
        launcherPosition = "end";
        launcherUseDistroLogo = false;
        launcherIcon = "";
        launcherIconColor = "none";
        pinnedStatic = false;
        inactiveIndicators = false;
        groupApps = false;
        groupContextMenuMode = "extended";
        groupClickAction = "cycle";
        groupIndicatorStyle = "dots";
        deadOpacity = 0.6;
        animationSpeed = 1;
        sitOnFrame = false;
        showDockIndicator = false;
        indicatorThickness = 3;
        indicatorColor = "primary";
        indicatorOpacity = 0.6;
      };
      network = {
        bluetoothRssiPollingEnabled = false;
        bluetoothRssiPollIntervalMs = 10000;
        networkPanelView = "wifi";
        wifiDetailsViewMode = "grid";
        bluetoothDetailsViewMode = "grid";
        bluetoothHideUnnamedDevices = false;
        disableDiscoverability = false;
        bluetoothAutoConnect = true;
      };
      sessionMenu = {
        enableCountdown = true;
        countdownDuration = 5000;
        position = "center";
        showHeader = true;
        showKeybinds = false;
        largeButtonsStyle = true;
        largeButtonsLayout = "grid";
        powerOptions = [
          {
            action = "lock";
            command = "";
            countdownEnabled = true;
            enabled = true;
            keybind = "1";
          }
          {
            action = "suspend";
            command = "";
            countdownEnabled = true;
            enabled = true;
            keybind = "2";
          }
          {
            action = "hibernate";
            command = "";
            countdownEnabled = true;
            enabled = false;
            keybind = "";
          }
          {
            action = "reboot";
            command = "";
            countdownEnabled = true;
            enabled = true;
            keybind = "3";
          }
          {
            action = "logout";
            command = "";
            countdownEnabled = true;
            enabled = true;
            keybind = "4";
          }
          {
            action = "shutdown";
            command = "";
            countdownEnabled = true;
            enabled = true;
            keybind = "5";
          }
          {
            action = "rebootToUefi";
            command = "";
            countdownEnabled = true;
            enabled = true;
            keybind = "6";
          }
          {
            action = "userspaceReboot";
            command = "";
            countdownEnabled = true;
            enabled = false;
            keybind = "";
          }
        ];
      };
      notifications = {
        enabled = true;
        enableMarkdown = true;
        density = "default";
        monitors = [ ];
        location = "top_left";
        overlayLayer = true;
        backgroundOpacity = 1;
        respectExpireTimeout = true;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 3;
        criticalUrgencyDuration = 15;
        clearDismissed = true;
        saveToHistory = {
          low = true;
          normal = true;
          critical = true;
        };
        sounds = {
          enabled = false;
          volume = 0.5;
          separateSounds = false;
          criticalSoundFile = "";
          normalSoundFile = "";
          lowSoundFile = "";
          excludedApps = "discord,firefox,chrome,chromium,edge";
        };
        enableMediaToast = false;
        enableKeyboardLayoutToast = false;
        enableBatteryToast = false;
      };
      osd = {
        enabled = true;
        location = "top_left";
        autoHideMs = 800;
        overlayLayer = true;
        backgroundOpacity = 1;
        enabledTypes = [
          2
          3
        ];
        monitors = [ ];
      };
      audio = {
        volumeStep = 5;
        volumeOverdrive = false;
        spectrumFrameRate = 30;
        visualizerType = "linear";
        spectrumMirrored = true;
        mprisBlacklist = [ ];
        preferredPlayer = "";
        volumeFeedback = false;
        volumeFeedbackSoundFile = "";
      };
      brightness = {
        brightnessStep = 5;
        enforceMinimum = true;
        enableDdcSupport = false;
        backlightDeviceMappings = [ ];
      };
      colorSchemes = {
        useWallpaperColors = false;
        predefinedScheme = "";
        darkMode = true;
        schedulingMode = "off";
        manualSunrise = "06:30";
        manualSunset = "18:30";
        generationMethod = "rainbow";
        monitorForColors = "";
        syncGsettings = true;
      };
      templates = {
        activeTemplates = [ ];
        enableUserTheming = false;
      };
      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        nightTemp = "2085";
        dayTemp = "2585";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };
      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
        screenLock = "";
        screenUnlock = "";
        performanceModeEnabled = "";
        performanceModeDisabled = "";
        startup = "";
        session = "";
        colorGeneration = "";
      };
      plugins = {
        autoUpdate = false;
        notifyUpdates = true;
      };
      idle = {
        enabled = false;
        screenOffTimeout = 600;
        lockTimeout = 660;
        suspendTimeout = 1800;
        fadeDuration = 5;
        screenOffCommand = "";
        lockCommand = "";
        suspendCommand = "";
        resumeScreenOffCommand = "";
        resumeLockCommand = "";
        resumeSuspendCommand = "";
        customCommands = "[]";
      };
      desktopWidgets = {
        enabled = false;
        overviewEnabled = true;
        gridSnap = false;
        gridSnapScale = false;
        monitorWidgets = [
          {
            name = "eDP-1";
            widgets = [ ];
          }
        ];
      };
    };
  };
}
