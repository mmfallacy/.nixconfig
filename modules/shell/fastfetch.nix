{
  flake.hjemModules.fastfetch =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.custom.home.fastfetch.enable = lib.mkEnableOption "home.fastfetch";

      config = lib.mkIf config.custom.home.fastfetch.enable {
        packages = [ pkgs.fastfetch ];
        files.".zshrc".text = # bash
          ''
            ${pkgs.fastfetch}/bin/fastfetch --config examples/21.jsonc
          '';
      };
    };
}
