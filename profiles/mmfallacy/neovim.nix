{
  units,
  extras,
  pkgs,
  lib,
  ...
}:
{
  home.packages =
    let
      inherit (pkgs) age;

      bin = pkg: lib.getExe pkg;

      nixnvim = extras.nixnvim.override {
        wrapperArgs = [
          # Do note that --set VAR VAL treats VAL as an explicit string, hence no runtime evaluation.
          "--run"
          ''export GEMINI_API_KEY="$(${bin age} --decrypt -i ~/.ssh/age.key ${extras.secrets.mmfallacy.GEMINI_API_KEY} | tr -d '\n')"''
        ];

        # Set vim alias for mmfallacy profile.
        aliases = [ "vim" ];
      };

      nvcd = pkgs.writeShellScriptBin "nvcd" ''
        pushd "$1" && ${bin nixnvim} . "''${@:2}" && popd
      '';
    in
    [
      nixnvim
      nvcd
    ];
}
