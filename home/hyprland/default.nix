{
  pkgs,
  config,
  ...
}: {

  # wallpaper, binary file
  #home.file.".config/i3/wallpaper.jpg".source = ../../wallpaper.jpg;

  home.file.".config/hypr" = {
    source = ./hypr;
    recursive = true;
    executable = true;  # make all scripts executable
  };


  home.file.".config/waybar" = {
    source = ./waybar;
    recursive = true;
    executable = true;  # make all scripts executable
  };
}