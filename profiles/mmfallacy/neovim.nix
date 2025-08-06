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
      bin = pkg: lib.getExe pkgs.${pkg};

      nixnvim = extras.nixnvim.override {
        wrapperArgs = [
          # Do note that --set VAR VAL treats VAL as an explicit string, hence no runtime evaluation.
          "--run"
          ''export GEMINI_API_KEY="$(${bin "age"} --decrypt -i ~/.ssh/age.key ${extras.secrets.mmfallacy.GEMINI_API_KEY} | tr -d '\n')"''
        ];

        # Set vim alias for mmfallacy profile.
        aliases = [ "vim" ];
      };
    in
    [ nixnvim ];
}
