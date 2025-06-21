# modules/networking.nix
{ config, pkgs, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.nameservers = [ "8.8.8.8" "1.1.1.1" ];
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443 ];
    allowedUDPPorts = [ 53 ]; # For DNS
  };

  # DNS resolver with caching
  services.resolved = {
    enable = true;
    extraConfig = ''
      DNSStubListener=yes
      Cache=yes
      DNSSEC=allow-downgrade
    '';
  };

  # mDNS for local network discovery
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      domain = true;
    };
  };
}
