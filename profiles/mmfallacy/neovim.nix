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
      nixnvim = extras.nixnvim.overrideAttrs {
        wrapperArgs = [
          # Do note that --set VAR VAL treats VAL as an explicit string, hence no runtime evaluation.
          "--run"
          ''export GEMINI_API_KEY="$(age --decrypt -i ~/.ssh/age.key ${extras.secrets.mmfallacy.GEMINI_API_KEY} | tr -d '\n')"''
        ];

        # Set vim alias for mmfallacy profile.
        aliases = [ "vim" ];
      };
    in
    [ nixnvim ];
}
