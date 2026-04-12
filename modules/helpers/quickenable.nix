{
  flake.nixosModules.quickenable =
    { config, lib, ... }:
    {
      options.custom.quickenable.system = {
        enable = lib.mkEnableOption "system.quickenable" // {
          default = true;
        };
        modules = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
          description = "List of system modules to enable.";
        };
      };
      config =
        let
          cfg = config.custom.quickenable.system;
          mapper = name: {
            inherit name;
            value.enable = true;
          };
        in
        lib.mkIf cfg.enable {
          custom.system = lib.pipe cfg.modules [
            (map mapper)
            builtins.listToAttrs
          ];
        };
    };

  flake.hjemModules.quickenable =
    { config, lib, ... }:
    {
      options.custom.quickenable.hjem = {
        enable = lib.mkEnableOption "hjem.quickenable" // {
          default = true;
        };
        modules = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          default = [ ];
          description = "List of hjem modules to enable.";
        };
      };
      config =
        let
          cfg = config.custom.quickenable.hjem;
          mapper = name: {
            inherit name;
            value.enable = true;
          };
        in
        lib.mkIf cfg.enable {
          custom.home = lib.pipe cfg.modules [
            (map mapper)
            builtins.listToAttrs
          ];
        };
    };
}
