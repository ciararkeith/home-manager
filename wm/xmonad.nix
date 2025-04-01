{ config, lib, pkgs, ... }:

{
	services = {
		gnome.gnome-keyring.enable = true;
		upower.enable = true;
		# dbus.enabled = true;

		xserver = {
			enable = true;
			#xstartDbusSession = true;
			layout = "us";
			libinput = {
				enable = true;
				disableWhileTyping = true;
			};

			displayManager.defaultSession = "none+xmonad";
		
			windowManager.xmonad = {
				enable = true;
				enableContribAndExtras = true;
			};

			xkb.options = "caps:ctrl_modifier";
		};

	};

	hardware.bluetooth.enable = true;
	services.blueman.enable = true;

	systemd.services.upower.enable = true;
}
