# Creates a normal user given the name and description. In addition:
# - It adds created user to "networkmanager" and "wheel" group.
# - It links home-manager.user.${username} to `./users/{username}.nix`;

username: description ? username: {
    users.users.${username} = {
      isNormalUser = true;
      inherit description;
      extraGroups = [ "networkmanager" "wheel" ];
    };
    networking.hostName = username;

    home-manager.users.${username} = "./users/${username}.nix";
}
