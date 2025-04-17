{ config, lib, pkgs, stdenv, ... }:

{
	programs.home-manager.enable = true;
	imports = [
		./services/dunst/default.nix
	];

	home = {
		stateVersion = "25.05";
		username = "ciara";
		homeDirectory = "/home/ciara";
  		sessionVariables = {
    			EDITOR = "nvim";
			BROWSER = "/etc/profiles/per-user/ciara/bin/firefox";
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
