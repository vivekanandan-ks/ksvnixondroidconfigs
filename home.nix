{ config, lib, pkgs, inputs, ... }:

{
  # Read the changelog before changing this value
  home.stateVersion = "24.05";

  # insert home-manager config
  #nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  home.packages = with pkgs; [
	gh
	#git
	nano
	git-town
	#rip2 # NA - not available in nix-on-droid
	tldr
	man
	bat	

  ]; 

  programs.git = {
	enable = true;
	package = pkgs.git;
	extraConfig = {
		user.name = "vivekanandan-ks";
		user.email = "ksvdevksv@gmail.com";
		init.defaultBranch = "main";
	};	
  };

}
