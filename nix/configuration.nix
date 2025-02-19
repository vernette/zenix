{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hardware-configuration.nix 
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  boot = {

    loader = { 

      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };

      timeout = 1;
      efi.canTouchEfiVariables = true;
    };

    kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver.videoDrivers = ["nvidia"];
  services.displayManager.ly.enable = true;

  hardware = {
    graphics.enable = true;
    nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
    nvidia.open = true;
    nvidia.modesetting.enable = true;
    nvidia.nvidiaSettings = true;
    nvidia.powerManagement.enable = true;
  };

  users.users.vernette = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.zsh;
    home = "/home/vernette";
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  services.pcscd.enable = true;

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
    nix-ld = {
      enable = true;
      libraries = [];
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  # virtualisation.vmware.guest.enable = true; # VMs only

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    ly
    gcc
    git
    cudatoolkit
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    noto-fonts-color-emoji
  ];

  services.openssh.enable = true;

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };
  services.open-webui.enable = true;

  system.stateVersion = "24.11";
}
