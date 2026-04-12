{
  flake.hjemModules.omniwm =
    { config, lib, ... }:
    {
      config = lib.mkIf config.custom.home.omniwm.enable {
        xdg.config.files."omniwm/settings.json".value = {
          hotkeysEnabled = true;

          hotkeyBindings = [
            # Workspace switching
            {
              binding = "Option+1";
              id = "switchWorkspace.0";
            }
            {
              binding = "Option+Shift+1";
              id = "moveToWorkspace.0";
            }
            {
              binding = "Option+2";
              id = "switchWorkspace.1";
            }
            {
              binding = "Option+Shift+2";
              id = "moveToWorkspace.1";
            }
            {
              binding = "Option+3";
              id = "switchWorkspace.2";
            }
            {
              binding = "Option+Shift+3";
              id = "moveToWorkspace.2";
            }
            {
              binding = "Option+4";
              id = "switchWorkspace.3";
            }
            {
              binding = "Option+Shift+4";
              id = "moveToWorkspace.3";
            }
            {
              binding = "Option+5";
              id = "switchWorkspace.4";
            }
            {
              binding = "Option+Shift+5";
              id = "moveToWorkspace.4";
            }
            {
              binding = "Option+6";
              id = "switchWorkspace.5";
            }
            {
              binding = "Option+Shift+6";
              id = "moveToWorkspace.5";
            }
            {
              binding = "Option+7";
              id = "switchWorkspace.6";
            }
            {
              binding = "Option+Shift+7";
              id = "moveToWorkspace.6";
            }
            {
              binding = "Option+8";
              id = "switchWorkspace.7";
            }
            {
              binding = "Option+Shift+8";
              id = "moveToWorkspace.7";
            }
            {
              binding = "Option+9";
              id = "switchWorkspace.8";
            }
            {
              binding = "Option+Shift+9";
              id = "moveToWorkspace.8";
            }
            {
              binding = "Control+Option+Tab";
              id = "workspaceBackAndForth";
            }

            # Focus
            {
              binding = "Option+H";
              id = "focus.left";
            }
            {
              binding = "Option+J";
              id = "focus.down";
            }
            {
              binding = "Option+K";
              id = "focus.up";
            }
            {
              binding = "Option+L";
              id = "focus.right";
            }
            {
              binding = "Option+Tab";
              id = "focusPrevious";
            }

            # Window state
            {
              binding = "Option+F";
              id = "toggleFullscreen";
            }
            {
              binding = "Unassigned";
              id = "toggleNativeFullscreen";
            }

            # Move window
            {
              binding = "Option+Shift+J";
              id = "move.down";
            }
            {
              binding = "Option+Shift+K";
              id = "move.up";
            }

            # Column management
            {
              binding = "Option+Shift+H";
              id = "moveColumn.left";
            }
            {
              binding = "Option+Shift+L";
              id = "moveColumn.right";
            }
            {
              binding = "Option+I";
              id = "focusColumnFirst";
            }
            {
              binding = "Option+A";
              id = "focusColumnLast";
            }

            {
              binding = "Option+.";
              id = "cycleColumnWidthForward";
            }
            {
              binding = "Option+,";
              id = "cycleColumnWidthBackward";
            }
            {
              binding = "Option+Shift+F";
              id = "toggleColumnFullWidth";
            }
            {
              binding = "Option+Shift+B";
              id = "balanceSizes";
            }

            # Resize
            {
              binding = "Option+-";
              id = "resizeGrow.left";
            }
            {
              binding = "Option+=";
              id = "resizeGrow.right";
            }
            {
              binding = "Option+Shift+-";
              id = "resizeGrow.up";
            }
            {
              binding = "Option+Shift+=";
              id = "resizeGrow.down";
            }

            # UI / misc
            {
              binding = "Control+Option+Space";
              id = "openCommandPalette";
            }
            {
              binding = "Unassigned";
              id = "toggleWorkspaceLayout";
            }
          ];
        };
      };
    };
}
