{ config, pkgs, username, ... }:

{

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';


  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Monitoring
    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # Archives
    unzip
    zip

    # File Browsers
    dolphin
    mc

    # Terminal
    kitty

    # Utils
    tree
    neofetch

    # Docker
    docker-compose

    # My
    discord
    webex
    spotify

    # Sound
    playerctl
    easyeffects
    cava

    # Networkmanager app
    networkmanagerapplet
    
    # IDE
    vscode





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





  # Install firefox
  programs.firefox.enable = true;

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = true;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };


  programs.bash = {
    enable = true;
    enableCompletion = true;


    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };
}
