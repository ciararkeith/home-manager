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
	

	programs.zsh = {
		enable = true;
		enableCompletion = true;
		syntaxHighlighting.enable = true;
		
		oh-my-zsh = {
			enable = true;
			plugins = [ ];
			theme = "robbyrussell";
		};

		zplug = {
			enable = true;
			plugins = [
				{ name = "zsh-users/zsh-autosuggestions"; }
#				{ name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
			];
		};

#		autosuggestions.enable = true;
		shellAliases = {
			ll = "ls -l";
			update = "sudo nixos-rebuild switch";
			update-home = "home-manager switch";
		};

		history.size = 10000;
	};
}
