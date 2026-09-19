{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users.users.bloink = {
    isNormalUser = true;
    description = "Bloink Bloinkson";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}
