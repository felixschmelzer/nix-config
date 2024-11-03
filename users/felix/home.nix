{pkgs, ...}: {
##############################################################################################################

  imports = [
    ../../home/core.nix
    ../../home/programs
  ];

  
  programs.git = {
    enable = true;
    userName = "felixschmelzer";
    userEmail = "felix@felix-schmelzer.de";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}