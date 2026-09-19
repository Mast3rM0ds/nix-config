{ ... }:

{
  networking.networkmanager.enable = true;

  services.openssh.enable = true;

  networking.firewall.enable = false;
}
