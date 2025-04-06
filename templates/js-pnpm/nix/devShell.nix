{
  pkgs,
}:
pkgs.mkShell {
  name = "js-pnpm-starter";

  nativeBuildInputs =
    [
      pkgs.nodejs_23
    ]
    ++ pkgs.lib.mapAttrstoList (k: v: pkgs.writeShellScriptBin k v) {
      pnpm = "corepack pnpm \$@";
      pnpx = "corepack pnpx \$@";
    };
}
