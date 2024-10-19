{config, lib, ...}:

let
  PROGRAM = "whatever";
in {
  options.sysmodules.${PROGRAM}.enable = lib.mkEnableOption PROGRAM;

  config = lib.mkIf config.sysmodules.${PROGRAM}.enable {
    # Insert configuration here to include when `config.sysmodules.${PROGRAM} is enabled`.
  };
}
