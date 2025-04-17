# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./wm/hyprland.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  services.mysql = {
  	enable = true;
	package = pkgs.mariadb;
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "mydatabase" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
   };
 
  time.timeZone = "America/Chicago";
  fonts.packages = with pkgs; [ 
  	(nerdfonts.override { fonts = [ "Hack" "FiraCode" ]; })
	fira-code
  ];
 
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.flatpak.enable = true;
 
  users.users.ciara = {
    isNormalUser = true;
    description = "ciara";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "mysql" ];
    packages = with pkgs; [ firefox vesktop chromium nitrogen xmobar spotify mpv obs-studio zsh goxlr-utility pavucontrol grim fastfetch github-cli bemenu wofi ghostty foot dmenu hyprcursor hyprpaper wtf tldr ];
  };

  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
     wget
     git
     home-manager
     neovim
     nautilus
     btop
  ];
 
  services.goxlr-utility.enable = true;

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };


  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
  };

  services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [ 443 80 23 ];
  networking.firewall.allowedUDPPorts = [ 443 80 23 ];

  system.stateVersion = "25.05"; 
}
