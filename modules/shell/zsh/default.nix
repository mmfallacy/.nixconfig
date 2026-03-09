{
  flake.nixosModules.zsh =
    { ... }:
    {
      programs.zsh = {
        enable = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
        enableCompletion = true;

        setOptions = [
          "HIST_IGNORE_DUPS"
          "SHARE_HISTORY"
          "EXTENDED_HISTORY"
          # `cd`s push to directory stack
          "AUTO_PUSHD"
          "PUSHD_IGNORE_DUPS"
          # show list on ambiguous completion.
          "AUTO_LIST"
          # move cursor to end of completed word.
          "ALWAYS_TO_END"
          # show completion menu on successive tab press
          "AUTO_MENU"
        ];
      };
    };

  flake.hjemModules.zsh =
    { config, lib, ... }:
    let
      inherit (lib.modules) mkIf;
      hasSessionVars = config.environment.sessionVariables != { };
    in
    {
      files.".zshenv" = mkIf hasSessionVars { source = config.environment.loadEnv; };
    };
}
