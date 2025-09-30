{ config, lib, ... }:
let
  cfg = config.custom.multi-user-git;
in
{
  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = builtins.length cfg.users > 0;
        message = "multi-user-git enabled but no additional users supplied";
      }
    ];

  };

  options.custom.multi-user-git =
    let
      inherit (lib) types;
      userType = types.submodule {
        options = {
          username = lib.mkOption {
            type = lib.types.str;
            description = "Git username";
          };
          email = lib.mkOption {
            type = lib.types.str;
            description = "Git email";
          };
          signingKey = lib.mkOption {
            type = lib.types.str;
            description = "Git signing key";
          };
        };
      };
    in
    {
      enable = lib.mkEnableOption "Enable Multi User Git module";

      users = lib.mkOption {
        default = [ ];
        description = ''
          List of users to add on top of the default const.username and const.email
        '';
        type = types.listOf userType;
      };
    };
}
