{ config, lib, pkgs, stdenv, ... }:

{
	programs.home-manager.enable = true;
	imports = [
		./programs/xmonad/default.nix
		./programs/alacritty/default.nix
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
	
	programs.starship = {
		enable = true;
		settings = {
			add_newline = true;
			format = ''$all'';
		};
	};

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		syntaxHighlighting.enable = true;

		zplug = {
			enable = true;
			plugins = [
				{ name = "zsh-users/zsh-autosuggestions"; }
			];
		};

		shellAliases = {
			ll = "ls -l";
			update = "sudo nixos-rebuild switch";
			switch = "home-manager switch";
			neofetch = "fastfetch";
		};

		history.size = 10000;
	};
}
