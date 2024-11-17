{ config, pkgs, lib, ... }:
let
  PROGRAM = "gnupg";
  cfg = {
    environment.systemPackages = with pkgs; [ gnupg ];
    programs.gnupg.agent.enable = true;
    programs.gnupg.agent.enableSSHSupport = true;
  };
in {
  options.sysmodules.${PROGRAM}.enable = lib.mkEnableOption PROGRAM;
  config = lib.mkIf config.sysmodules.${PROGRAM}.enable cfg;
}
