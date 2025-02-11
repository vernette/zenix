{ config, pkgs, unstable, ... }:

{
  home = {
    username = "vernette";
    homeDirectory = "/home/vernette";
    
    packages = with pkgs; [
      neovim
      ripgrep
      nodejs_20
      python313
      unzip
      zip
      # foot # VMs only
      kitty
      nautilus
      rofi-wayland
      mako
      libnotify
      fastfetch
      eza
      fzf
      zoxide
      oh-my-posh
      krabby
      yazi
      sshfs
      unstable.ayugram-desktop
      dig
      iperf3
      bat
      delta
      opencommit
      wl-clipboard
      swww
      hyprshot
      hypridle
      hyprlock
      nvtopPackages.full
    ];

    stateVersion = "24.11";
  };

  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
  };
  
  programs.git = {
    enable = true;
    userName = "Nikita Skryabin";
    delta = {
      enable = true;
      options = {
        navigate = true;
        dark = true;
        side-by-side = true;
      };
    };
    extraConfig = {
      init.defaultBranch = "master";
      pull.rebase = false;
      merge.conflictstyle = "zdiff3";
    };
  };
}
