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
        xdg.config.files."mango/animations.conf".text = ''
          animations=1
          layer_animations=1

          animation_type_open=zoom
          animation_type_close=zoom
          animation_fade_in=1
          animation_fade_out=1
          tag_animation_direction=1

          zoom_initial_ratio=0.92
          zoom_end_ratio=1.0

          fadein_begin_opacity=0.0
          fadeout_begin_opacity=1.0

          animation_duration_move=300
          animation_duration_open=250
          animation_duration_tag=250
          animation_duration_close=250
          animation_duration_focus=0

          animation_curve_open=0.22,1.0,0.36,1.0
          animation_curve_move=0.22,1.0,0.36,1.0
          animation_curve_tag=0.22,1.0,0.36,1.0
          animation_curve_close=0.22,1.0,0.36,1.0
          animation_curve_focus=0.22,1.0,0.36,1.0

          animation_curve_opafadeout=0.5,0.5,0.5,0.5
          animation_curve_opafadein=0.22,1.0,0.36,1.0
        '';
      };
    };
}
