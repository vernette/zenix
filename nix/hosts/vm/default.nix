{ config, lib, pkgs, ... }:

{
  imports = [ 
    ../common
    ../../hardware-configuration.nix 
  ];

  networking.hostName = "vm";

  virtualisation.vmware.guest.enable = true;

  environment.systemPackages = with pkgs; [
    foot
  ];
}