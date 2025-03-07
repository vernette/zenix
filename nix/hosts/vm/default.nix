{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../common
    ../../hardware-configuration.nix
  ];

  networking.hostName = "vm";

  users.users.vernette = {
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCRXQwbNxXXxsHuoqgShwmEledy+ywuB40A7EBIDUDPBnz+Cr56rprLXRL8qeXno1OMmLMPTq3oIngdoS8nzqZDbYdJ2XiysDkq9Dhj5nYUh0WSIp0lz0FznRzU2stwmerGaXk8oXKgwNcYjUl4EtrKFl5jzyYy/AkVRpNr/sVsqPee8EBZh/e9jh3FfWsPNLUktokMzmIg5n1J6rnRcWD6Y8NNWPDhD8SwEd4zENnpNKgNgdsESj/nVcU4wwx6ZV5HtQI12eTbX01lsGWNuSTiR0mIwfdkoR/6Gyw23ZqOwmaicCSl7Id6Rbw3Nif6OYxJyELBAxmdI7MezmNB8hj1wn6ZWtwDDyZn2c+4eWiXQcJsiHCfpzdGuaE/im+EWmZAjngfIqhJYBh2aUIoumwI6Qoz+pjnv6TvO3v91EAM2P/RpVolxdOFk7AQf37LPi0mHbeKZV054wIkxIYcYTboG4HGdc6knZ8aqIO4nMEmFCsZ6ssTpfAQsr4aoV5oRoE="
    ];
  };

  virtualisation.vmware.guest.enable = true;

  environment.systemPackages = with pkgs; [
    foot
  ];
}
