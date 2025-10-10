{
  units,
  extras,
  pkgs,
  lib,
  ...
}:
{
  home.packages =
    let
      inherit (pkgs) age;

      bin = pkg: lib.getExe pkg;

      nixnvim = extras.nixnvim.neovim.override (prev: {
        wrapperArgs = [
          # Do note that --set VAR VAL treats VAL as an explicit string, hence no runtime evaluation.
          "--run"
          ''export GEMINI_API_KEY="$(${bin age} --decrypt -i ~/.ssh/age.key ${extras.secrets.mmfallacy.GEMINI_API_KEY} | tr -d '\n')"''
        ];

        extraBinPath = prev.extraBinPath ++ [
          extras.nixnvim.gemini-cli
        ];

        # Set vim alias for mmfallacy profile.
        aliases = [ "vim" ];
      });

      # nixnvim based on ~/.nixnvim/nvimrc/
      nvim = nixnvim.devMode;

      # Nvim but temporarily check out given dir
      nvcd = pkgs.writeShellScriptBin "nvcd" ''
        pushd "$1" && ${bin nvim} . "''${@:2}" && popd
      '';

      # Neogit from CLI
      ngit = pkgs.writeShellScriptBin "ngit" ''
        ${bin nvim} . -c ":execute 'Neogit' | tabprevious | tabclose"
      '';

      # Flake-locked nixnvim
      nvfl = pkgs.symlinkJoin rec {
        name = "nvfl";
        meta.mainProgram = name;
        paths = [ nixnvim ];
        postBuild = ''
          # Rename nvim output to name
          mv $out/bin/nvim $out/bin/${name}
        '';

      };

      aider = pkgs.stdenvNoCC.mkDerivation {
        name = "aider-wrapped";
        dontUnpack = true;
        buildInputs = [
          pkgs.makeWrapper
        ];
        runtimeInputs = [
          pkgs.age
        ];
        installPhase = ''
          mkdir -p $out/bin
          makeWrapper ${bin extras.nixnvim.aider} $out/bin/aider \
            --run 'export GEMINI_API_KEY="$(${bin age} --decrypt -i ~/.ssh/age.key ${extras.secrets.mmfallacy.GEMINI_API_KEY} | tr -d '\n')"'
        '';
      };

      gemini-cli = pkgs.stdenvNoCC.mkDerivation {
        name = "gemini-cli-wrapped";
        dontUnpack = true;
        buildInputs = [
          pkgs.makeWrapper
        ];
        runtimeInputs = [
          pkgs.age
        ];
        installPhase = ''
          mkdir -p $out/bin
          makeWrapper ${bin extras.nixnvim.gemini-cli} $out/bin/gemini-cli \
            --run 'export GEMINI_API_KEY="$(${bin age} --decrypt -i ~/.ssh/age.key ${extras.secrets.mmfallacy.GEMINI_API_KEY} | tr -d '\n')"'
        '';
      };

    in
    [
      nvim
      gemini-cli
      aider
      ngit
      nvcd
      nvfl
    ];
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
