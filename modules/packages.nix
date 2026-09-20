{ pkgs, ... }:

{

  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
   };
  environment.systemPackages = with pkgs; [
    # editor / basics
    neovim
    wget
    gh
    unzip
    zip

    # toolchains
    gcc
    gnumake
    clang
    rustc
    cargo

    # desktop
    kitty
    rofi
    waybar
    awww
    wl-clipboard
    nautilus
    firefox
    pywalfox-native

    # media / apps
    mpv
    ffmpeg
    obs-studio
    #modrinth-app
    vesktop
    lunar-client # im testing out lunar instead of modrinth app dunno..
    distrobox
    gnome-calculator
    gnome-calendar
    gnome-disk-utility
    gnome-text-editor

    # theming
    matugen
    nwg-look
    bibata-cursors
    adw-gtk3
    darkly
    kdePackages.qt6ct
    libsForQt5.qt5ct
    adwaita-icon-theme

    # shell candy
    eza
    fetch
    fastfetch
    pfetch
  ];
}
