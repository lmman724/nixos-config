# modules/desktop.nix
{ config, pkgs, ... }:

{
  # X11 & KDE Plasma
  services.xserver = {
    enable = true;
    xkb.layout = "us";
  };
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # Enable Wayland support
  };
  services.desktopManager.plasma6.enable = true;

  # NVIDIA driver
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Sound with PipeWire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true; # Add JACK support for pro audio
  };

  # Printing
  services.printing = {
    enable = true;
    drivers = with pkgs; [ hplip cups-filters ];
  };

  # Flatpak support
  services.flatpak.enable = true;
}
