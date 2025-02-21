{ config, pkgs, unstable, ... }:

{
  imports = [ ../common ];

  home.packages = with pkgs; [
    foot
  ];
}