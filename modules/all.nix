top:
let
  removeSelf = attrs: builtins.removeAttrs attrs [ "all" ];
in
{
  flake.nixosModules.all =
    {
      ...
    }:
    {
      imports = builtins.attrValues (removeSelf top.config.flake.nixosModules);
    };

  flake.hjemModules.all =
    {
      ...
    }:
    {
      imports = builtins.attrValues (removeSelf top.config.flake.hjemModules);
    };

  flake.darwinModules.all =
    {
      ...
    }:
    {
      imports = builtins.attrValues (removeSelf top.config.flake.darwinModules);
    };
}
