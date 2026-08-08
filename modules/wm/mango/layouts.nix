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
        xdg.config.files."mango/layouts.conf".text = ''
          scroller_structs=20
          scroller_default_proportion=0.8
          scroller_focus_center=0
          scroller_prefer_center=0
          edge_scroller_pointer_focus=1
          scroller_default_proportion_single=1.0
          scroller_proportion_preset=0.5,0.8,1.0

          tagrule=id:1,layout_name:scroller
          tagrule=id:2,layout_name:scroller
          tagrule=id:3,layout_name:scroller
          tagrule=id:4,layout_name:scroller
          tagrule=id:5,layout_name:scroller
          tagrule=id:6,layout_name:scroller
          tagrule=id:7,layout_name:scroller
          tagrule=id:8,layout_name:scroller
          tagrule=id:9,layout_name:scroller

          scratchpad_width_ratio=0.8
          scratchpad_height_ratio=0.9
        '';
      };
    };
}
