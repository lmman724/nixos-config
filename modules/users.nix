# modules/users.nix
{ config, pkgs, ... }:

{
  # Locale
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "vi_VN";
    LC_IDENTIFICATION = "vi_VN";
    LC_MEASUREMENT = "vi_VN";
    LC_MONETARY = "vi_VN";
    LC_NAME = "vi_VN";
    LC_NUMERIC = "vi_VN";
    LC_PAPER = "vi_VN";
    LC_TELEPHONE = "vi_VN";
    LC_TIME = "vi_VN";
  };

  # Users
  users.users.lmman = {
    isNormalUser = true;
    description = "lmman";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    openssh.authorizedKeys.keys = [
      # Add your SSH public key here
      # "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAI..."
    ];
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.dolphin
      firefox
    ];
  };

  # SSH
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
    };
  };

  # Enable sudo without password for wheel group
  security.sudo.wheelNeedsPassword = false;

  # ZSH + Oh-My-Zsh + Powerlevel10k
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "powerlevel10k/powerlevel10k";
      plugins = [
        "git"
        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
        "fzf"
      ];
    };
  };

  users.defaultUserShell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    zsh
    oh-my-zsh
    fzf
    bat
    ripgrep
    jq

    # ZSH Plugins
    zsh-autosuggestions
    zsh-syntax-highlighting

    # Nerd font for powerlevel10k
    nerd-fonts.meslo-lg
  ];
}
