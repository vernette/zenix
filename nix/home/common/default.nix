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
      dig
      iperf3
      bat
      delta
      unstable.opencommit
      wl-clipboard
      swww
      hyprshot
      hypridle
      hyprlock
      btop
      pass
      nekoray
      wlogout
      jq
      statix
      alejandra
      stow
    ];

    stateVersion = "24.11";
  };

  programs.firefox = {
    enable = true;
    package = pkgs.librewolf;
    policies = {
      ExtensionSettings = with builtins;
        let extension = shortId: uuid: {
          name = uuid;
          value = {
            install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
            installation_mode = "normal_installed";
          };
        };
        in listToAttrs [
          (extension "ublock-origin" "uBlock0@raymondhill.net")
          (extension "darkreader" "addon@darkreader.org")
          (extension "xbs" "{019b606a-6f61-4d01-af2a-cea528f606da}")
          (extension "sponsorblock" "sponsorBlocker@ajay.app")
          (extension "foxyproxy-standard" "foxyproxy@eric.h.jung")
        ];
      };
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
