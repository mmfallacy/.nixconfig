{
  flake.hjemModules.kitty =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.custom.home.kitty.enable = lib.mkEnableOption "home.kitty";

      config = lib.mkIf config.custom.home.kitty.enable {
        packages = [ pkgs.kitty ];
        xdg.config.files."kitty/kitty.conf".text = # kitty
          ''
            font_size        16.0

            macos_titlebar_color background
            macos_option_as_alt yes
            hide_window_decorations titlebar-only

            tab_bar_edge top
            tab_bar_style powerline

            repaint_delay 10
            input_delay 3
            sync_to_monitor yes

            enable_audio_bell no
            visual_bell_duration 0

            mouse_hide_wait 3.0

            copy_on_select yes
            strip_trailing_spaces smart

            map ctrl+shift+c copy_to_clipboard
            map ctrl+shift+v paste_from_clipboard
            map ctrl+shift+t new_tab
            map ctrl+shift+w close_tab
            map ctrl+shift+enter new_window

            detect_urls yes
            open_url_modifiers ctrl

            confirm_os_window_close 2
          '';
      };
    };
}
