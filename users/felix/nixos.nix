{
  ##################################################################################################################
  #
  # NixOS Configuration
  #
  ##################################################################################################################

  users.users.felix = {
    openssh.authorizedKeys.keys = [
    ];
  };
}