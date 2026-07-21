top: {
  flake.nixosMachineModules.aetheron =
    {
      config,
      lib,
      ...
    }:
    {
      hjem.users.mmfallacy = rec {
        directory = config.users.users.mmfallacy.home;

        environment.sessionVariables = {
          CITRO_DEVSHELL_SRC = "${directory}/dev/citro-devshells";
          CITRO_GIT_DIR = "${directory}/dev/platform.git";
        };

        files.".zshrc".text =
          lib.mkAfter # bash
            ''
              export PNPM_HOME="$HOME/Library/pnpm"
              case ":$PATH:" in
                *":$PNPM_HOME:"*) ;;
                *) export PATH="$PNPM_HOME:$PATH" ;;
              esac
            '';
      };
    };

}
