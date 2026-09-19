{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
  ];

  fonts.fontconfig.defaultFonts.emoji = [ "Noto Color Emoji" ];
}
