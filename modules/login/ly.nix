{
  flake.nixosModules.ly =
    {
      config,
      pkgs,
      ...
    }:
    let
      capitalize = str: with pkgs.lib; toUpper (substring 0 1 str) + substring 1 (-1) str;
    in
    {
      services.displayManager.ly = {
        enable = true;
        settings = {
          animation = "matrix";
          initial_info_text = capitalize config.networking.hostName;
          text_in_center = "true";
          min_refresh_delta = 2;
        };
      };
    };
}
