{config, lib, ...}:

let
  PROGRAM = "whatever";
  cfg = {
    # Insert configuration here to include when `config.sysmodules.${PROGRAM} is enabled`.
  };
in {
  options.sysmodules.${PROGRAM}.enable = lib.mkEnableOption PROGRAM;
  config = lib.mkIf config.sysmodules.${PROGRAM}.enable cfg;
}
