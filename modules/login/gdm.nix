{
  flake.nixosModules.gdm =
    {
      config,
      pkgs,
      ...
    }:
    {
      services.displayManager.ly = {
        enable = true;
        settings = {
          animation = "matrix";
          initial_info_text = pkgs.lib.mkDefault "Vesperon";
          text_in_center = "true";
          min_refresh_delta = 2;

          # In >v1.0.2, wayland_cmd and x_cmd_setup is merged.
          setup_cmd = "${config.services.displayManager.sessionData.wrapper}";
        };
      };
    };
}
