{
  flake.hjemModules.starship =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      mkTOMLGenerator = pkgs.formats.toml { };
      starshipTOMLGen = mkTOMLGenerator.generate "starship-config";
    in
    {
      options.custom.home.starship.enable = lib.mkEnableOption "home.starship";

      config = lib.mkIf config.custom.home.starship.enable {
        packages = [ pkgs.starship ];
        files.".zshrc".text = # bash
          ''
            if [[ $TERM != "dumb" ]]; then
              eval "$(${lib.getExe pkgs.starship} init zsh)"
            fi
          '';

        xdg.config.files."starship.toml" = {
          generator = starshipTOMLGen;
          value = {
            add_newline = true;
          };
        };
      };
    };
}
