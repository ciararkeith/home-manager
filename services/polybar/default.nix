{ config, pkgs, ... }:

let
	mypolybar = pkgs.polybar.override {
		alsaSupport = true;
		githubSupport = true;
		mpdSupport = true;
		pulseSupport = true;
	};

 # bars = builtins.readFile ./bars.ini;
 # colors = builtins.readFile ./colors.ini;
 # mods1 = builtins.readFile ./modules.ini;
 # mods2 = builtins.readFile ./user_modules.ini;

 # mprisScript = pkgs.callPackage ./scripts/mpris.nix {};

in
{
	services.polybar = {
		enable = false;
		config = /etc/polybar/config.ini;
		script = ''
			polybar top &
		'';
	
	};
}
