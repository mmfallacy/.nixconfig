{ pkgs, ... }:
let
  remapScript = pkgs.writeShellScriptBin "remap-esc-caps" ''
    ${pkgs.kbd}/bin/setkeycodes 0x3a 1
    ${pkgs.kbd}/bin/setkeycodes 0x01 58
    exit 0
  '';
in
{
  systemd.services.esc-caps-remap = {
    description = "Remap CapsLock to Esc for builtin keyboard";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${remapScript}/bin/remap-esc-caps";
      RemainAfterExit = true;
    };
    wantedBy = [ "multi-user.target" ];
  };
}
