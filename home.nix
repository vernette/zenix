{ config, pkgs, ... }:

{
  home = {
    username = "vernette";
    homeDirectory = "/home/vernette";
    
    packages = with pkgs; [
      neovim
      nodejs_20
      python313
      unzip
      zip
      foot
      nautilus
      rofi-wayland
      libnotify
      librewolf
      fastfetch
      eza
      fzf
      zoxide
      oh-my-posh
      krabby
      yazi
      sshfs
    ];

    stateVersion = "24.11";
  };
}
