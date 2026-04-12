{
  flake.hjemModules.eza =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.custom.home.eza.enable = lib.mkEnableOption "home.eza";

      config = lib.mkIf config.custom.home.eza.enable {
        packages = [ pkgs.eza ];
        files.".zshrc".text =
          let
            eza = "eza --icons --header --git-ignore";
          in
          # bash
          ''
            alias ls="${eza} -l";
            alias lso="${eza}";
            alias lst="${eza} --tree";
            alias lsta="eza --tree --icons --header"
          '';
      };
    };
}
