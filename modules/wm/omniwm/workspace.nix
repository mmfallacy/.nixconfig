{
  flake.hjemModules.omniwm =
    { config, lib, ... }:
    {
      config = lib.mkIf config.custom.home.omniwm.enable {
        xdg.config.files."omniwm/settings.json".value = {
          workspaceConfigurations = [
            {
              id = "AD36F001-C57E-41A5-AC1D-DF5249D007F0";
              layoutType = "niri";
              monitorAssignment = {
                type = "main";
              };
              name = "1";
            }
            {
              id = "454CECD4-5E9D-4ED1-95D7-979D48817F5F";
              layoutType = "niri";
              monitorAssignment = {
                type = "main";
              };
              name = "2";
            }
            {
              id = "BEB842B5-E894-4791-9FD1-397C3CDD3538";
              layoutType = "niri";
              monitorAssignment = {
                type = "main";
              };
              name = "3";
            }
            {
              id = "248AA883-2261-4D45-943C-79C0E46A232B";
              layoutType = "niri";
              monitorAssignment = {
                type = "main";
              };
              name = "4";
            }
            {
              id = "8B8C45D6-CE9E-41D9-BD50-BE4989D5E3DE";
              layoutType = "niri";
              monitorAssignment = {
                type = "main";
              };
              name = "5";
            }
          ];

          monitorBarSettings = [ ];

          hiddenBarIsCollapsed = true;

          statusBarShowAppNames = false;
          statusBarShowWorkspaceName = false;
          statusBarUseWorkspaceId = true;

          workspaceBarEnabled = false;
          workspaceBarPosition = "belowMenuBar";
          workspaceBarHeight = 24;
          workspaceBarNotchAware = false;
          workspaceBarReserveLayoutSpace = false;
          workspaceBarWindowLevel = "popup";
          workspaceBarXOffset = 0;
          workspaceBarYOffset = 0;
          workspaceBarBackgroundOpacity = 0.1;
          workspaceBarHideEmptyWorkspaces = false;
          workspaceBarShowFloatingWindows = false;
          workspaceBarShowLabels = false;
          workspaceBarLabelFontSize = 12;
          workspaceBarDeduplicateAppIcons = true;

          # Accent color (-1 = system default)
          workspaceBarAccentColorAlpha = 1;
          workspaceBarAccentColorRed = -1;
          workspaceBarAccentColorGreen = -1;
          workspaceBarAccentColorBlue = -1;

          # Text color (-1 = system default)
          workspaceBarTextColorAlpha = 1;
          workspaceBarTextColorRed = -1;
          workspaceBarTextColorGreen = -1;
          workspaceBarTextColorBlue = -1;
        };
      };
    };
}
