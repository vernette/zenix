{ config, pkgs, unstable, ... }:

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
      fastfetch
      eza
      lsd
      fzf
      zoxide
      oh-my-posh
      krabby
      yazi
      sshfs
      unstable.ayugram-desktop
      dig
      bat
    ];

    stateVersion = "24.11";
  };

  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
  };
  
  programs.git = {
    enable = true;
    userName = "vernette";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
