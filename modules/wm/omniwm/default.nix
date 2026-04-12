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

        launchd.user.agents.my-startup-app = {
          script = ''
            /Applications/Nix Apps/OmniWM.app/Contents/MacOS/OmniWM
          '';
          serviceConfig = {
            RunAtLoad = true;
            KeepAlive = true;
          };
          managedBy = "custom.system.omniwm.enable";
        };
      };
    };

}
