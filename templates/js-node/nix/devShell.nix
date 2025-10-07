{
  pkgs,
}:
pkgs.mkShell {
  name = "js-pnpm-template";

  nativeBuildInputs =
    with pkgs;
    [
      nodejs_24
      vtsls
      # vscode-langservers-extracted
      # nodePackages.prettier
      # emmet-language-server
      # tailwindcss-language-server
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
