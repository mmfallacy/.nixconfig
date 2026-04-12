{
  flake.nixosModules.gnome =
    { config, lib, ... }:
    {
      options.custom.system.gnome.enable = lib.mkEnableOption "system.gnome";

      config = lib.mkIf config.custom.system.gnome.enable {
        # Desktop Environment
        services.xserver.enable = true;
        services.xserver.desktopManager.gnome.enable = true;
        services.xserver.xkb = {
          layout = "us";
          variant = "";
        };
      };
    };
}
