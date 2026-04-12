{
  flake.hjemModules.multi-user-git =
    {
      lib,
      ...
    }:
    {
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
    };
}
