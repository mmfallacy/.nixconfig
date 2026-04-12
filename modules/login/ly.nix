{
  flake.nixosModules.ly =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      capitalize = str: with pkgs.lib; toUpper (substring 0 1 str) + substring 1 (-1) str;
    in
    {
      options.custom.system.ly.enable = lib.mkEnableOption "system.ly";

      config = lib.mkIf config.custom.system.ly.enable {
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
    };
}
