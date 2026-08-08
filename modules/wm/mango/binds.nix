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
        xdg.config.files."mango/binds.conf".text = ''
          bind=SUPER,r,reload_config
          bind=SUPER+SHIFT,m,quit
          bind=SUPER,q,killclient

          bind=SUPER,t,spawn,kitty
          bind=SUPER+SHIFT,t,spawn,$TERMINAL

          bind=SUPER,o,focuslast
          bind=ALT,Tab,focusstack,next
          bind=ALT+SHIFT,Tab,focusstack,last
          bind=SUPER,h,focusdir,left
          bind=SUPER,l,focusdir,right

          bind=SUPER+SHIFT,k,exchange_client,up
          bind=SUPER+SHIFT,j,exchange_client,down
          bind=SUPER+SHIFT,h,exchange_client,left
          bind=SUPER+SHIFT,l,exchange_client,right

          bind=CTRL+SUPER+SHIFT,k,scroller_stack,up
          bind=CTRL+SUPER+SHIFT,j,scroller_stack,down
          bind=CTRL+SUPER+SHIFT,h,scroller_stack,left
          bind=CTRL+SUPER+SHIFT,l,scroller_stack,right

          bind=CTRL+SUPER,h,resizewin,-50,+0
          bind=CTRL+SUPER,l,resizewin,+50,+0

          bind=SUPER,p,togglefloating
          bind=SUPER,f,togglemaximizescreen
          bind=SUPER+SHIFT,f,togglefullscreen

          bind=SUPER,k,viewtoleft
          bind=SUPER,j,viewtoright

          bind=SUPER,1,view,1,0
          bind=SUPER,2,view,2,0
          bind=SUPER,3,view,3,0
          bind=SUPER,4,view,4,0
          bind=SUPER,5,view,5,0
          bind=SUPER,6,view,6,0
          bind=SUPER,7,view,7,0
          bind=SUPER,8,view,8,0
          bind=SUPER,9,view,9,0

          bind=SUPER+SHIFT,1,tagsilent,1
          bind=SUPER+SHIFT,2,tagsilent,2
          bind=SUPER+SHIFT,3,tagsilent,3
          bind=SUPER+SHIFT,4,tagsilent,4
          bind=SUPER+SHIFT,5,tagsilent,5
          bind=SUPER+SHIFT,6,tagsilent,6
          bind=SUPER+SHIFT,7,tagsilent,7
          bind=SUPER+SHIFT,8,tagsilent,8
          bind=SUPER+SHIFT,9,tagsilent,9
        '';
      };
    };
}
