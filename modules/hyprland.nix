
{ config, pkgs, username, ... }:

{
  environment.systemPackages = with pkgs; [
    # Hyprland Setup
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
    # Lockscreen
    hyprlock
    # Clipboard Manager
    cliphist
    wl-clipboard
  ];
  

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

}