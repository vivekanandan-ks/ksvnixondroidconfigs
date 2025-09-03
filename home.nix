{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  # Read the changelog before changing this value
  home.stateVersion = "24.05";

  # insert home-manager config
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.registry.n.flake = inputs.nixpkgs; 

  imports = [
    ./homeModules/shells.nix
		./homeModules/terminal-tools-hm.nix
		./homeModules/cli-apps-hm.nix
	#./homeModules/nvf-hm.nix
		./homeModules/micro-editor-hm.nix

  ];

  home.packages = with pkgs; [
    gh
    #git
    nano
    #git-town
    rip2 # NA - not available in nix-on-droid 24.05
    tldr
    man
    ripgrep
    #ripgrep-all
    #bat
    duf
    
    # basic tools
    procps
    killall
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    #xz
    zip
    unzip
    
    coreutils
    which
    

    #nerd-fonts.monofur # font for starship
    #( nerdfonts.override { fonts = [ "Monofur" ]; }) #nerd fonts aren't working in n-o-d

  ];

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    #EDITOR = "micro"; # micro added in cli-apps-hm.nix file
    #MANPAGER = "sh -c 'col -b | bat -l man -p '"; # add -p flag to bat for plain style
    #SHELL = "${pkgs.nushell}/bin/nu"; # this doesnt work in nod

  };

  home.shellAliases = {
    #rm = "echo Use 'rip' instead of rm.";
    #rip = "rip --graveyard ~/.local/share/Trash/files/rip2trash";
    #df = "echo try duf instead";
    #grep = "echo 'try ripgrep or ripgrep-all and rg or rga is the command'";
    #man = "batman";

  };

  /*programs = {
    git = {
      enable = true;
      package = pkgs.git;
      extraConfig = {
        user.name = "vivekanandan-ks";
        user.email = "ksvdevksv@gmail.com";
        init.defaultBranch = "main";
      };
    };

  };*/

}
