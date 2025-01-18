{ config, pkgs, ... }:
{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
      initial_info_text = "Vesperon";
      text_in_center = "true";
      min_refresh_delta = 2;

      # In >v1.0.2, wayland_cmd and x_cmd_setup is merged.
      setup_cmd = "${config.services.displayManager.sessionData.wrapper}";

    };
    # Temporarily use own fork until v1.0.3 release.
    package = pkgs.ly.overrideAttrs {
      src = pkgs.fetchFromGitHub {
        # Use own fork.
        # Resolve build.zig.zon to reuse previous url.
        owner = "mmfallacy";
        repo = "ly";
        rev = "7b9b55f9a8fac017e3b56975d08d687d18f65337";
        hash = "sha256-73cHcsotgfov9hR0uJAC6HwCFEZCIzoZuVO+uBZG4vA=";
      };
    };
  };
}
