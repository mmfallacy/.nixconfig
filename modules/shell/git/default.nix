{
  flake.hjemModules.git =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.custom.home.git.enable = lib.mkEnableOption "home.git";

      config = lib.mkIf config.custom.home.git.enable {
        packages = [ pkgs.git ];

        xdg.config.files."git/config" = {
          generator = lib.generators.toGitINI;
          value =
            let
              difft = lib.getExe pkgs.difftastic;
            in
            {
              # Let multi-user-git handle credentials
              user.useConfigOnly = true;

              url."ssh://git@github.com/".insteadOf = "github:";
              url."https://github.com/".insteadOf = "gh-https:";
              rerere = {
                enabled = true;
                autoUpdate = true;
              };

              merge.tool = lib.mkDefault "nvim";
              diff.tool = lib.mkDefault "nvimdiff";

              init.defaultBranch = "main";

              gpg.format = "ssh";
              commit.gpgSign = true;
              tag.gpgSign = true;

              # Use difftastic for better syntax-aware git diffs.
              diff.external = difft;
              diff.tool = lib.mkDefault "difftastic";
              difftool.difftastic.cmd = "${difft} $LOCAL $REMOTE";
            };
        };
      };
    };
}
