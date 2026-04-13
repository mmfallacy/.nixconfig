top: {
  flake.nixosMachineModules.aetheron =
    {
      config,
      ...
    }:
    {
      hjem.users.mmfallacy = rec {
        directory = config.users.users.mmfallacy.home;

        environment.sessionVariables = {
          CITRO_DEVSHELL_SRC = "${directory}/dev/citro-devshells";
          CITRO_GIT_DIR = "${directory}/dev/platform.git";
        };
      };
    };

}
