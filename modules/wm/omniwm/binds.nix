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
            {
              binding = "Unassigned";
              id = "switchWorkspace.next";
            }
            {
              binding = "Unassigned";
              id = "switchWorkspace.previous";
            }

            # Focus
            {
              binding = "Option+Left Arrow";
              id = "focus.left";
            }
            {
              binding = "Option+Down Arrow";
              id = "focus.down";
            }
            {
              binding = "Option+Up Arrow";
              id = "focus.up";
            }
            {
              binding = "Option+Right Arrow";
              id = "focus.right";
            }
            {
              binding = "Option+Tab";
              id = "focusPrevious";
            }
            {
              binding = "Unassigned";
              id = "focusDownOrLeft";
            }
            {
              binding = "Unassigned";
              id = "focusUpOrRight";
            }

            # Move window to workspace
            {
              binding = "Control+Option+Shift+Up Arrow";
              id = "moveWindowToWorkspaceUp";
            }
            {
              binding = "Control+Option+Shift+Down Arrow";
              id = "moveWindowToWorkspaceDown";
            }
            {
              binding = "Control+Option+Shift+Page Up";
              id = "moveColumnToWorkspaceUp";
            }
            {
              binding = "Control+Option+Shift+Page Down";
              id = "moveColumnToWorkspaceDown";
            }
            {
              binding = "Unassigned";
              id = "moveColumnToWorkspace.0";
            }
            {
              binding = "Unassigned";
              id = "moveColumnToWorkspace.1";
            }
            {
              binding = "Unassigned";
              id = "moveColumnToWorkspace.2";
            }
            {
              binding = "Unassigned";
              id = "moveColumnToWorkspace.3";
            }
            {
              binding = "Unassigned";
              id = "moveColumnToWorkspace.4";
            }
            {
              binding = "Unassigned";
              id = "moveColumnToWorkspace.5";
            }
            {
              binding = "Unassigned";
              id = "moveColumnToWorkspace.6";
            }
            {
              binding = "Unassigned";
              id = "moveColumnToWorkspace.7";
            }
            {
              binding = "Unassigned";
              id = "moveColumnToWorkspace.8";
            }

            # Move window
            {
              binding = "Option+Shift+Left Arrow";
              id = "move.left";
            }
            {
              binding = "Option+Shift+Down Arrow";
              id = "move.down";
            }
            {
              binding = "Option+Shift+Up Arrow";
              id = "move.up";
            }
            {
              binding = "Option+Shift+Right Arrow";
              id = "move.right";
            }

            # Monitor focus
            {
              binding = "Control+Command+Tab";
              id = "focusMonitorNext";
            }
            {
              binding = "Unassigned";
              id = "focusMonitorPrevious";
            }
            {
              binding = "Control+Command+\`";
              id = "focusMonitorLast";
            }

            # Window state
            {
              binding = "Option+Return";
              id = "toggleFullscreen";
            }
            {
              binding = "Unassigned";
              id = "toggleNativeFullscreen";
            }

            # Column management
            {
              binding = "Control+Option+Shift+Left Arrow";
              id = "moveColumn.left";
            }
            {
              binding = "Control+Option+Shift+Right Arrow";
              id = "moveColumn.right";
            }
            {
              binding = "Option+T";
              id = "toggleColumnTabbed";
            }
            {
              binding = "Option+Home";
              id = "focusColumnFirst";
            }
            {
              binding = "Option+End";
              id = "focusColumnLast";
            }
            {
              binding = "Control+Option+1";
              id = "focusColumn.0";
            }
            {
              binding = "Control+Option+2";
              id = "focusColumn.1";
            }
            {
              binding = "Control+Option+3";
              id = "focusColumn.2";
            }
            {
              binding = "Control+Option+4";
              id = "focusColumn.3";
            }
            {
              binding = "Control+Option+5";
              id = "focusColumn.4";
            }
            {
              binding = "Control+Option+6";
              id = "focusColumn.5";
            }
            {
              binding = "Control+Option+7";
              id = "focusColumn.6";
            }
            {
              binding = "Control+Option+8";
              id = "focusColumn.7";
            }
            {
              binding = "Control+Option+9";
              id = "focusColumn.8";
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

            # Dwindle layout
            {
              binding = "Unassigned";
              id = "moveToRoot";
            }
            {
              binding = "Unassigned";
              id = "toggleSplit";
            }
            {
              binding = "Unassigned";
              id = "swapSplit";
            }

            # Resize
            {
              binding = "Unassigned";
              id = "resizeGrow.left";
            }
            {
              binding = "Unassigned";
              id = "resizeGrow.right";
            }
            {
              binding = "Unassigned";
              id = "resizeGrow.up";
            }
            {
              binding = "Unassigned";
              id = "resizeGrow.down";
            }
            {
              binding = "Unassigned";
              id = "resizeShrink.left";
            }
            {
              binding = "Unassigned";
              id = "resizeShrink.right";
            }
            {
              binding = "Unassigned";
              id = "resizeShrink.up";
            }
            {
              binding = "Unassigned";
              id = "resizeShrink.down";
            }

            # Preselect
            {
              binding = "Unassigned";
              id = "preselect.left";
            }
            {
              binding = "Unassigned";
              id = "preselect.right";
            }
            {
              binding = "Unassigned";
              id = "preselect.up";
            }
            {
              binding = "Unassigned";
              id = "preselect.down";
            }
            {
              binding = "Unassigned";
              id = "preselectClear";
            }

            # UI / misc
            {
              binding = "Control+Option+Space";
              id = "openCommandPalette";
            }
            {
              binding = "Option+Shift+R";
              id = "raiseAllFloatingWindows";
            }
            {
              binding = "Unassigned";
              id = "rescueOffscreenWindows";
            }
            {
              binding = "Unassigned";
              id = "toggleFocusedWindowFloating";
            }
            {
              binding = "Unassigned";
              id = "assignFocusedWindowToScratchpad";
            }
            {
              binding = "Unassigned";
              id = "toggleScratchpadWindow";
            }
            {
              binding = "Control+Option+M";
              id = "openMenuAnywhere";
            }
            {
              binding = "Unassigned";
              id = "toggleWorkspaceBarVisibility";
            }
            {
              binding = "Unassigned";
              id = "toggleHiddenBar";
            }
            {
              binding = "Option+\`";
              id = "toggleQuakeTerminal";
            }
            {
              binding = "Option+Shift+L";
              id = "toggleWorkspaceLayout";
            }
            {
              binding = "Option+Shift+O";
              id = "toggleOverview";
            }
          ];
        };
      };
    };
}
