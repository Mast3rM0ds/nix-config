{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  # services.displayManager.ly.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = false;
    xwayland.enable = true;
  };

  services.dbus.enable = true;
  services.gvfs.enable = true;
  programs.nix-ld.enable = true;
  programs.fuse.enable = true;
  programs.fuse.userAllowOther = true;

  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
