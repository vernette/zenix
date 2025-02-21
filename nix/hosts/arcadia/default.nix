{ config, lib, pkgs, ... }:

{
  imports = [ 
    ../common
    ../../hardware-configuration.nix 
  ];

  networking.hostName = "arcadia";

  boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];

  services.xserver.videoDrivers = ["nvidia"];

  hardware = {
    graphics.enable = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      open = true;
      modesetting.enable = true;
      nvidiaSettings = true;
      powerManagement.enable = true;
    };
  };

  virtualisation.docker.enable = true;
  users.users.vernette.extraGroups = [ "docker" ];

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };
  services.open-webui.enable = true;

  environment.systemPackages = with pkgs; [
    cudatoolkit
  ];
}