{ config, ... }:

let
  repo = "${config.home.homeDirectory}/nix-config";
  link = path: config.lib.file.mkOutOfStoreSymlink "${repo}/dotfiles/${path}";
in
{
  xdg.configFile = {
    "hypr/hyprland.lua".source = link "hypr/hyprland.lua";

    "kitty/kitty.conf".source = link "kitty/kitty.conf";
    "waybar".source = link "waybar";
    "rofi".source = link "rofi";
    "matugen".source = link "matugen";
  };
}
