{
  flake.nixosModules.ly =
    {
      config,
      pkgs,
      ...
    }:
    let
      capitalize = str: with pkgs.lib; toUpper (substring 0 1 str) + substring 1 (-1) s;
    in
    {
      services.displayManager.ly = {
        enable = true;
        settings = {
          animation = "matrix";
          initial_info_text = capitalize config.networking.hostname;
          text_in_center = "true";
          min_refresh_delta = 2;

          # In >v1.0.2, wayland_cmd and x_cmd_setup is merged.
          setup_cmd = "${config.services.displayManager.sessionData.wrapper}";

        };
      };
    };
}
