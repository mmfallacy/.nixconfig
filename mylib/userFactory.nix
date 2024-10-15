# Creates a normal user
# Adds to network manager and wheel group
# Sets hostname
# Sets home.nix.

userFolder:
  let
    mkUser = username: description: {
      users.users.${username} = {
        isNormalUser = true;
        inherit description;
        extraGroups = [ "networkmanager" "wheel" ];
      };

      networking.hostName = username;

      home-manager.users.${username} = import "${userFolder}/${username}.nix";
    };
  in
    mkUser
