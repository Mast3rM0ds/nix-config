{ ... }:

{
  programs.git = {
    enable = true;
    config = {
      user.name = "bloink";
      user.email = "applab766@gmail.com";
      init.defaultBranch = "main";
    };
  };
}
