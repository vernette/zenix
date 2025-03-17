{ config, pkgs, unstable, ... }:

{
  imports = [ ../common ];

  home.packages = with pkgs; [
    nvtopPackages.full
    unstable.ayugram-desktop
    unstable.code-cursor
    obs-studio
    overskride
  ];
}
