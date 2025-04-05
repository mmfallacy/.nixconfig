# mmfallacy's `.nixconfig` FAQ

Frankly, nobody actually asked these questions. These are questions that I'll probably ask in the future as I incrementally build my configuration.

## 1. Code-splitting should be done through NixOS modules where all modules are imported but only some are enabled. Why did you structure your modules outside this convention?

My system and user units (fancy way of calling modules lol) are designed to be imported only when needed. This is in stark contrast to the common pattern where all modules are always imported, and an enable option dictates whether they will be used or not. Since most of my system and user units are currently small and simple, I did not want to wrap them in the usual boilerplate required for enable options. I might reconsider this in the future and adopt something similar to [NotAShelf's `nyx`](https://github.com/notashelf/nyx) if I encounter an issue.

## 2. Why home-manager?

Currently, most of the programs I use are supported in home-manager. HM's module system also fits majority of my needs hence why I still use it. Only drawback I've experienced is that home-manager evaluates slowly, hence a simple change in my configuration requires a few seconds of evaluation. I might consider switching to `hjem` and `hjem-rum` in the future.

## 3. Why do you want to support a multi-user environment?

Honestly, I don't know. I might need a configuration for multiple users in the future. Despite having `profiles/` though, my configuration largely revolves around my `mmfallacy` profile. This means that majority of the system and user units are written in the context of my use case, hence this configuration really doesn't have multi-user support yet. As of writing, I have already migrated into the new `profiles` (See PR #1).

With this new structure, it is possible to run into duplicate declaration errors as configuration might conflict between the three separated user-level setups. This can be addressed by being intentional in writing the configurations. That is, to set a convention in writing config as such:

- `profiles/common/*` should have the lowest priority (either `lib.mkDefault` at 1000 or a lower priority value)
- `profiles/<profile>/*` should have the [default priority of 100](https://github.com/NixOS/nixpkgs/blob/f8b8860d1bbd654706ae21017bd8da694614c440/lib/modules.nix#L1375C29-L1375C30).
- `machines/<machine>/home/*` should have the highest priority (either through `lib.mkForce` at 50 or a higher priority value).

See [`nixpkgs/lib/modules.nix`](https://github.com/NixOS/nixpkgs/blob/f8b8860d1bbd654706ae21017bd8da694614c440/lib/modules.nix#L1373) for more info on priority and order.

On the other hand for non primitive attributes like lists and attrsets, the discretion on order should follow the same hierarchy. That is, `profiles/common/*` should be overridable by both `profiles/<profile>/*` and `machines/<machine>/home/*`.

## 4. Why do you have `home.nix` in machine-specific configuration?

`home.nix` in the machine-specific configuration add overrides on top of the base configuration (typically the associated `profiles/<profile>/home.nix`). This serves as the exact home-manager entry point, where I can define configuration overrides specific to the machine (e.g. Git signing keys, Default terminal, Machine-specific session variables).
