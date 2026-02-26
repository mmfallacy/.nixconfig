{
  inputs,
  extras,
  units,
  ...
}:
inputs.nix-darwin.lib.darwinSystem {
  modules = [ ./configuration.nix ];
  specialArgs = { inherit inputs extras units; };
}
