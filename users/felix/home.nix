{pkgs, ...}: {
##############################################################################################################

  imports = [
    ../../home/core.nix
    
    ../../home/programs.nix
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