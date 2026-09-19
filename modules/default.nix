{ ... }:

{
  imports = [
    ./boot.nix
    ./nix.nix
    ./locale.nix
    ./networking.nix
    ./desktop.nix
    ./audio.nix
    ./fonts.nix
    ./users.nix
    ./git.nix
    ./packages.nix
  ];
}
