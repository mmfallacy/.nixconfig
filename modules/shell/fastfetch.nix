{
  flake.hjemModules.fastfetch =
    {
      pkgs,
      ...
    }:
    {
      packages = [ pkgs.fastfetch ];
      files.".zshrc".text = # bash
        ''
          ${pkgs.fastfetch}/bin/fastfetch --config examples/21.jsonc
        '';
    };
}
