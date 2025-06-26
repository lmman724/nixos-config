{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/networking.nix
    ./modules/desktop.nix
    ./modules/users.nix
    ./modules/dev-tools.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Time zone and NTP
  time.timeZone = "Asia/Ho_Chi_Minh";
  services.timesyncd.enable = true;

  # Firmware
  hardware.enableAllFirmware = true;

  # Power management
  powerManagement.enable = true;
  services.upower.enable = true;

  # Auto upgrade system
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = false;

  nix.gc = {
  automatic = true;
  dates = "weekly";
  options = "--delete-older-than 7d";
  };

  
  # Version pin
  system.stateVersion = "25.05";

}
