{
  flake.hjemModules.multi-user-git =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.custom.multi-user-git;
    in
    {
      config = lib.mkIf cfg.enable {
        assertions = [
          {
            assertion = builtins.length cfg.users > 0;
            message = "multi-user-git enabled but no users supplied";
          }
        ];

        packages =
          let
            gitas = (pkgs.writers.writePython3Bin "gitas" { doCheck = false; } ./gitas.py).overrideAttrs (old: {
              # https://discourse.nixos.org/t/how-to-make-a-simple-substitution-when-using-pkgs-writers/32150/2
              buildCommand = old.buildCommand + ''
                substituteInPlace $out/bin/${old.name} \
                    --replace-fail '@@USERS@@' '${builtins.toJSON cfg.users}' \
                    --replace-fail '@@development@@' '@@actual@@'
              '';
            });
          in
          [
            pkgs.git
            gitas
          ];

        xdg.config.files."git/config".value = {
          # Reset global credentials
          user.name = "";
          user.email = "";
          user.signingkey = "";
          user.useConfigOnly = lib.mkForce true;

          # Set signing format via option
          gpg.format = cfg.signingFormat;
        };
      };
    };
}
