{
  flake.hjemModules.starship =
    {
      pkgs,
      lib,
      ...
    }:
    let
      mkTOMLGenerator = pkgs.formats.toml { };
      starshipTOMLGen = mkTOMLGenerator.generate "starship-config";
    in
    {
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
}
