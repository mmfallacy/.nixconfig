{config, lib, ...}:

let
  PROGRAM = "whatever";
  cfg = {
  };
in {
  options.usermodules.${PROGRAM}.enable = lib.mkEnableOption PROGRAM;
  config = lib.mkIf config.usermodules.${PROGRAM}.enable cfg;
}
