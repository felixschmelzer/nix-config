# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, username, ... }:

{
  imports =
    [ 
      ../../modules/system.nix
      
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 10;


  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  # Do not wait during boot
  systemd.services.NetworkManager-wait-online.enable = false;



  #TODO move!!
  # Enable Hyprland
  programs.hyprland.enable = true;
 
  # Enable Login with greetd
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.hyprland}/bin/hyprland";
        user = "${username}";
      };
      default_session = initial_session;
    };
  }; 


  # To enable Screensharing... with hyperland
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];



  # Configure console keymap
  console.keyMap = "de";


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    docker-compose
    htop
    tree
    dolphin
    kdePackages.qtwayland
    kdePackages.qtsvg
    waybar
    # Push notifications
    dunst
    # Needed for dunst
    libnotify
    # "launcher" like thing
    rofi-wayland
    # Wallpapers
    swww
    # Networkmanager app
    networkmanagerapplet
    # Midnight Commander
    mc
    # Media controll
    playerctl
    # Lockscreen
    hyprlock
    # Clipboard Manager
    cliphist
    wl-clipboard

  ];



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:




  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
