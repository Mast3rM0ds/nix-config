{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases.btw = "echo i use nixos, btw";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" ];
    };

    shellAliases = {
      rebuild = "git -C ~/nix-config add -A && nh os switch";
      update = "git -C ~/nix-config add -A && nh os switch -u";
      ls = "eza --icons";
    };

    initContent = ''
      function cd {
        builtin cd "$@" && ls
      }
      pfetch
    '';
  };

  home.packages = [
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile "${pkgs.nix-search-tv.src}/nixpkgs.sh";
    })
  ];
}
