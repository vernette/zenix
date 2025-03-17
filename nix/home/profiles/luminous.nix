{ config, pkgs, unstable, ... }:

{
  imports = [ ../common ];

  home.packages = with pkgs; [
    unstable.ayugram-desktop
    unstable.code-cursor
    obs-studio
    powertop
    upower
    overskride
  ];
}
