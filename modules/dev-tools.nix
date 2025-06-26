# modules/dev-tools.nix
{ config, pkgs, ... }:

{
  # Unfree packages
  nixpkgs.config.allowUnfree = true;

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      nerd-fonts.fira-code
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Liberation Serif" "Noto Serif CJK SC" ];
        sansSerif = [ "Liberation Sans" "Noto Sans CJK SC" ];
        monospace = [ "FiraCode Nerd Font Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };


  # Developer tools and GUI apps
  environment.systemPackages = with pkgs; [
    # Core utilities
    wget
    curl
    git
    htop
    unzip
    zip
    neofetch
    tree
    file
    lsof
    gnupg

    # Browsers
    google-chrome
    firefox



    # Development
    vscode
    docker
    docker-compose
    python3
    nodejs_20
    gcc
    gnumake
    cmake
    go
    rustup
    jdk17
    jetbrains.idea-community

    # Utilities
    tmux
    zsh
    oh-my-zsh
    bat
    fzf
    ripgrep
    jq
    remmina
  ];

  # Enable Docker
  virtualisation.docker.enable = true;

  # Bash improvements (fallback for non-zsh users)
  programs.bash.promptInit = ''
    export PS1="[\u@\h:\w]\$ "
    alias ll='ls -lah'
    alias gs='git status'
  '';
}
