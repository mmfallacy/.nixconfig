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
      normalize =
        name:
        let
          parts = lib.splitString "-" name;
          first = lib.head parts;
          rest = lib.concatStringsSep "-" (lib.tail parts);
        in
        "${lib.toUpper (lib.substring 0 1 first)}${lib.substring 1 (-1) first} (${rest})";
    in
    {
      options.custom.system.ly.enable = lib.mkEnableOption "system.ly";

      config = lib.mkIf config.custom.system.ly.enable {
        services.displayManager.ly = {
          enable = true;
          settings = {
            animation = "matrix";
            initial_info_text = capitalize (normalize config.networking.hostName);
            text_in_center = "true";
            min_refresh_delta = 2;
          };
        };
      };
    };
}
