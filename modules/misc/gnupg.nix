{ config, pkgs, lib, ... }:
let
  PROGRAM = "gnupg";
in {
  options.modules.${PROGRAM}.enable = lib.mkEnableOption PROGRAM;

  config = lib.mkIf config.modules.${PROGRAM}.enable {
    home.packages = with pkgs; [ gnupg ];
    programs.gnupg.agent.enable = true;
    programs.gnupg.agent.enableSSHSupport = true;
  };
}
