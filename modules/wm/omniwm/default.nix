{
  flake.darwinModules.omniwm =
    {
      config,
      lib,
      extras,
      ...
    }:
    {
      options.custom.system.omniwm.enable = lib.mkEnableOption "system.omniwm";

      config = lib.mkIf config.custom.system.omniwm.enable {
        environment.systemPackages = [
          extras.mypkgs.omniwm
        ];

        launchd.user.agents.omniwm = {
          command = "${extras.mypkgs.omniwm}/Applications/OmniWM.app/Contents/MacOS/OmniWM";
          serviceConfig = {
            RunAtLoad = true;
            KeepAlive = true;
          };
          managedBy = "custom.system.omniwm.enable";
        };
      };
    };

  flake.hjemModules.omniwm =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      toml = pkgs.formats.toml { };
    in
    {
      options.custom.home.omniwm.enable = lib.mkEnableOption "home.omniwm";
      config = lib.mkIf config.custom.home.omniwm.enable {
        xdg.config.files."omniwm/settings.toml" = {
          clobber = true;
          generator = toml.generate "settings.toml";
          value = {
            general = {
              ipcEnabled = false;
              preventSleepEnabled = false;
              updateChecksEnabled = true;
            };
          };
        };
      };
    };
}
