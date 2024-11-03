{
  pkgs,
  config,
  ...
}: {

  # wallpaper, binary file
  #home.file.".config/i3/wallpaper.jpg".source = ../../wallpaper.jpg;

  home.file.".config/hypr" = {
    source = ./hypr;
    # copy the scripts directory recursively
    recursive = true;
    executable = true;  # make all scripts executable
  };
}