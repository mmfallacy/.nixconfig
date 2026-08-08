{
  flake.hjemModules.mango =
    {
      config,
      lib,
      ...
    }:
    {
      config = lib.mkIf config.custom.home.mango.enable {
        # These binds presume that the primary layout is scroller
        xdg.config.files."mango/appearance.conf".text = ''
          rootcolor=0x303446ff
          bordercolor=0x414559ff
          focuscolor=0xbabbf1ff
          maximizescreencolor=0xa6d189ff
          urgentcolor=0xe78284ff
          scratchpadcolor=0xca9ee6ff
          globalcolor=0x8caaeeff
          overlaycolor=0x292c3cff

          blur=0
          shadows=0
          border_radius=6
          no_radius_when_single=0
          focused_opacity=1.0
          unfocused_opacity=1.0

          no_border_when_single=0

          gappih=5
          gappiv=5
          gappoh=10
          gappov=10
        '';
      };
    };
}
