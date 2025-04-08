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
      pnpm = "corepack pnpm \$@";
      pnpx = "corepack pnpx \$@";
    };
}
