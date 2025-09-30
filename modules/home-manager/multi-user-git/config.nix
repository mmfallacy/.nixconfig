{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.custom.multi-user-git;
in
{

  programs.git = {
    # Disable autowire const.username and email
    # These information will be wired per repo instead of a global file
    userName = lib.mkForce null;
    userEmail = lib.mkForce null;
    signing.key = lib.mkForce null;

    # Force global signingFormat
    extraConfig.gpg.format = lib.mkForce cfg.signingFormat;

    # Disable guessing for default user.email and user.name;
    extraConfig.user.useConfigOnly = true;
  };

  home.packages =
    let
      gitas = (pkgs.writers.writePython3Bin "gitas" { doCheck = false; } ./gitas.py).overrideAttrs (old: {
        # https://discourse.nixos.org/t/how-to-make-a-simple-substitution-when-using-pkgs-writers/32150/2
        buildCommand = old.buildCommand + ''
          substituteInPlace $out/bin/${old.name} \
              --replace-fail '@@USERS@@' '${builtins.toJSON cfg.users}' \
              --replace-fail '@@development@@' '@@actual@@'
        '';
      });
    in
    [
      gitas
    ];
}
