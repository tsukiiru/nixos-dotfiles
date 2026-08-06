{ pkgs, ... }: {
  xdg = {
    configFile."xdg-desktop-portal/niri-portals.conf".text = ''
      [preferred]
      default=gtk
      org.freedesktop.impl.portal.FileChooser=gtk
      org.freedesktop.impl.portal.ScreenCast=gnome
    '';
    portal.config = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
        pkgs.xdg-desktop-portal-gnome
      ];
      config.common.default = [ "gtk" ];
      niri."org.freedesktop.impl.portal.FileChooser" = "gtk";
    };
  };
}
