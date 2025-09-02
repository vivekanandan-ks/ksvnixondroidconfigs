{
  #inputs,
  #config,
  #lib,
  pkgs,
  ...
}:

{

  #btop
  programs.btop = {
    enable = true;
    package = pkgs.btop;
  };

  # bat # cat modern alternative
  programs.bat = {
    enable = true;
    package = pkgs.bat;
    extraPackages = with pkgs.bat-extras; [
      batman
    ];

  };

  # fastfetch
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;
    settings = builtins.fromJSON (builtins.readFile ./hmResources/fastfetch-settings.json);
  };

  # git
  programs.git = {
    enable = true;
    package = pkgs.git;
    extraConfig = {
      user.name = "vivekanandan-ks";
      user.email = "ksvdevksv@gmail.com";
      init.defaultBranch = "main";
      #core.editor = "nano";
    };
  };

  # jujutsu
  /*
    programs.jujutsu = {
      enable = true;
      package = pkgs-unstable.jujutsu;
      settings = {
        user = {
          email = "ksvdevksv@gmail.com";
          name = "vivekanandan-ks";
        };
        #ui.editor = "micro";
        snapshot.max-new-file-size = "10MiB"; # https://github.com/jj-vcs/jj/blob/main/docs/config.md#maximum-size-for-new-files
      };
    };
  */

  /*
    # github
    programs.gh = {
      enable = true ;
      package = pkgs-unstable.gh;
      #gitCredentialHelper = {
        #enable = true ;
        #hosts = [];
      #};
    };
  */

}
