{
  pkgs,
}:
pkgs.mkShell {
  name = "js-pnpm-template";

  nativeBuildInputs =
    [
      pkgs.nodejs_23
    ]
    ++ pkgs.lib.mapAttrsToList (k: v: pkgs.writeShellScriptBin k v) {
      npm = "corepack npm \$@";
      npx = "corepack npx \$@";

      yarn = "corepack yarn \$@";
      yarnpkgs = "corepack yarnpkgs \$@";

      pnpm = "corepack pnpm \$@";
      pnpx = "corepack pnpx \$@";
    };
}
