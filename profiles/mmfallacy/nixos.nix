{ ... } : let
  const = import ./const.nix;
  inherit (const) username name;
in {
  users.users.${username} = {
    isNormalUser = true;
    description = name;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${username} = ./home.nix;
}
