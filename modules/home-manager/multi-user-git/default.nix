{
  config,
  lib,
  pkgs,
  ...
}@args:
let
  cfg = config.custom.multi-user-git;
in
{
  config = lib.mkIf cfg.enable (
    {
      assertions = [
        {
          assertion = builtins.length cfg.users > 0;
          message = "multi-user-git enabled but no users supplied";
        }
        {
          assertion = config.programs.git.enable;
          message = "programs.git is not enabled";
        }
      ];
    }
    // import ./config.nix args
  );

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
          authKey = lib.mkOption {
            type = lib.types.str;
            description = "Git auth key";
          };
        };
      };
    in
    {
      enable = lib.mkEnableOption "Enable Multi User Git module";

      users = lib.mkOption {
        default = [ ];
        description = ''
          List of users to add. Note that this module removes const.username and const.email from the global git config
        '';
        type = types.listOf userType;
      };

      signingFormat = lib.mkOption {
        default = "ssh";
        description = ''
          Set global signing format of users.*.signingKey
        '';
        type = types.enum [
          "ssh"
          "gpg"
        ];
      };
    };
}
