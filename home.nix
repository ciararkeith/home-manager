{ config, lib, pkgs, stdenv, ... }:

{
	programs.home-manager.enable = true;
	imports = [
		./programs/xmonad/default.nix
		./programs/rofi/default.nix	
		./services/polybar/default.nix
		./services/dunst/default.nix
		./services/picom/default.nix
	];

#	programs.spotify.enable = true;
	
	home = {
		stateVersion = "24.11";
		username = "ciara";
		homeDirectory = "/home/ciara";
  		sessionVariables = {
    			EDITOR = "nvim";
			BROWSER = "firefox";
    			TERMINAL = "alacritty";
		};	
	};
}
