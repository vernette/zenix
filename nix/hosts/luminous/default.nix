{ config, lib, pkgs, ... }:

{
  imports = [ 
    ../common
    ../../hardware-configuration.nix 
  ];

  networking.hostName = "luminous";

  services = {
    thermald.enable = true;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };
    power-profiles-daemon.enable = false;
  };

  hardware = {
    bluetooth.enable = true;
    pulseaudio.enable = false;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    brightnessctl
    acpi
    powertop
  ];
}