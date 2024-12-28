inputs @ { lib , pkgs, ... } : let
  profiles = import ../../profiles inputs;
  inherit (profiles.mmfallacy) homeConfig const;
in with const; {
  users.users.${username} = {
    isNormalUser = true;
    description = name;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${username} = import ./home.nix;
}
