{
  flake.hjemModules.omniwm =
    { config, lib, ... }:
    {
      config = lib.mkIf config.custom.home.omniwm.enable {
        xdg.config.files."omniwm/settings.toml".value = {
          quakeTerminal = {
            animationDuration = 0.2;
            autoHide = false;
            backgroundBlurRadius = 0;
            backgroundEffect = "standardBlur";
            enabled = true;
            heightPercent = 50.0;
            monitorMode = "focusedWindow";
            opacity = 1.0;
            position = "center";
            widthPercent = 50.0;
          };
        };
      };
    };
}
