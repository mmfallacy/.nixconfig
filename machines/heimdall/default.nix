{ config, mkExtras, ... }:
let
  machine = "heimdall";
in
{
  perSystem =
    { pkgs, system, ... }:
    let
      extras = mkExtras system;
      nuci = pkgs.callPackage (extras.openwrt-nix + "/nix") { };
      configuration = nuci.writeUci config.flake.nuciConfigs.${machine};
    in
    {
      packages."${machine}-uci" = configuration.json;
      apps.${machine} = {
        type = "app";
        program = toString configuration.command;
      };
    };
}
