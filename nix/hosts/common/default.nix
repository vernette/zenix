{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  boot.loader = { 
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    timeout = 1;
    efi.canTouchEfiVariables = true;
  };

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.vernette = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    home = "/home/vernette";
  };

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    nix-ld = {
      enable = true;
      libraries = [];
    };
  };

  services = {
    pcscd.enable = true;
    openssh.enable = true;
    displayManager.ly.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    ly
    gcc
    git
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    noto-fonts-color-emoji
  ];

  system.stateVersion = "24.11";
}