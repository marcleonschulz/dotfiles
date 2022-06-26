# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)

{ inputs, lib, config, pkgs, ... }: {
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors), use something like:
    # inputs.nix-colors.homeManagerModule

    # Feel free to split up your configuration and import pieces of it here.
  ];
# Configure Home Manager settings.
  home.username = "marcschulz";
  home.homeDirectory = "/home/marcschulz";

  # Home Manager state version - better not change it.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Allow unfree packages.
  nixpkgs.config.allowUnfree = true;

  # Specify Home Manager packages.
  home.packages = with pkgs; [
    bitwarden
    postman
    python
    jetbrains.pycharm-professional
    jetbrains.jdk
    keepassxc
    vlc
    gimp
    clang
    vscode
    blender
    cudatoolkit
    libreoffice
    nodejs
    discord
    neofetch
    audacity
  ];
  programs.git = {
    enable = true;
    userName  = "marcleonschulz";
    userEmail = "marcleonschulz@gmail.com";
  };
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}
