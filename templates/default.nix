{ pkgs, lib, ... }:
{
  defaultFlags = {
    init = [
      "--no-confirm"
    ];
  };

  templates =
    let
      defaultRules = {
        ".gitignore" = {
          onConflict = "append";
        };
        "README.md" = {
          onConflict = "prepend";
        };
      };
      defaultParameters = [
        {
          name = "PROJNAME";
          prompt = "Enter Project Name";
          default = "`.nixconfig` flake template.";
        }
      ];
    in
    {
      base = {
        description = builtins.readFile ./base/README.md;
        root = ./base;
        rules = defaultRules;
        parameters = defaultParameters;
      };
      js-bun = {
        description = builtins.readFile ./js-bun/README.md;
        root = ./js-bun;
        rules = defaultRules;
        parameters = defaultParameters;
      };
      js-node = {
        description = ".nixconfig js-node template";
        root = ./js-node;
        rules = defaultRules;
        parameters = defaultParameters;
      };
      py-uv = {
        description = ".nixconfig py-uv template";
        root = ./py-uv;
        rules = defaultRules;
        parameters = defaultParameters;
      };
      rust = {
        description = builtins.readFile ./rust/README.md;
        root = ./rust;
        rules = defaultRules // {
          "src/*" = {
            onConflict = "ignore";
          };
        };
        parameters = defaultParameters;
      };
    };
}
