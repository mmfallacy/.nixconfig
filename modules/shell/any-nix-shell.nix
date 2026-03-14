{
  flake.hjemModules.any-nix-shell =
    {
      pkgs,
      ...
    }:
    {
      packages = [ pkgs.any-nix-shell ];
      files.".zshrc".text = # bash
        ''
          ${pkgs.any-nix-shell}/bin/any-nix-shell zsh --info-right | source /dev/stdin
        '';
    };
}
