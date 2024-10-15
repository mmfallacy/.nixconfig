{ config, pkgs, lib, ... }:
let
  PROGRAM = "gnupg";
in {
  options.sysmodules.${PROGRAM}.enable = lib.mkEnableOption PROGRAM;

  config = lib.mkIf config.sysmodules.${PROGRAM}.enable {
    environment.systemPackages = with pkgs; [ gnupg ];
    programs.gnupg.agent.enable = true;
    programs.gnupg.agent.enableSSHSupport = true;
  };
}
