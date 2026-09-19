{ ... }:

{
  imports = [
    ./shell.nix
    ./hyprland.nix
    ./dotfiles.nix
  ];

  home.username = "bloink";
  home.homeDirectory = "/home/bloink";
  home.stateVersion = "26.11";

}
