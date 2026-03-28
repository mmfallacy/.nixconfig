{
  flake.hjemModules.any-nix-shell =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.custom.home.any-nix-shell.enable = lib.mkEnableOption "home.any-nix-shell";

      config = lib.mkIf config.custom.home.any-nix-shell.enable {
        packages = [ pkgs.any-nix-shell ];
        files.".zshrc".text = # bash
          ''
            ${pkgs.any-nix-shell}/bin/any-nix-shell zsh --info-right | source /dev/stdin
          '';
      };
    };
}
