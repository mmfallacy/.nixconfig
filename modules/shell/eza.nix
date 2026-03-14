{
  flake.hjemModules.eza =
    {
      pkgs,
      ...
    }:
    {
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
          alias lsta="eza --tree --icons --header";
        '';
    };
}
