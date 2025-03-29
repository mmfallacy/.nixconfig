# mmfallacy's `.nixconfig` FAQ

Frankly, nobody actually asked these questions. These are questions that I'll probably ask in the future as I incrementally build my configuration.

## 1. Code-splitting should be done through NixOS modules where all modules are imported but only some are enabled. Why did you structure your modules outside this convention?

My system and user units (fancy way of calling modules lol) are designed to be imported only when needed. This is in stark contrast to the common pattern where all modules are always imported, and an enable option dictates whether they will be used or not. Since most of my system and user units are currently small and simple, I did not want to wrap them in the usual boilerplate required for enable options. I might reconsider this in the future and adopt something similar to [NotAShelf's `nyx`](https://github.com/notashelf/nyx) if I encounter an issue.

## 2. Why home-manager?

Currently, most of the programs I use are supported in home-manager. HM's module system also fits majority of my needs hence why I still use it. Only drawback I've experienced is that home-manager evaluates slowly, hence a simple change in my configuration requires a few seconds of evaluation. I might consider switching to `hjem` and `hjem-rum` in the future.

## 3. Why do you want to support a multi-user environment?

Honestly, I don't know. I might need a configuration for multiple users in the future. Despite having `profiles/` though, my configuration largely revolves around my `mmfallacy` profile. This means that majority of the system and user units are written in the context of my use case, hence this configuration really doesn't have multi-user support yet. I'm considering revising `profiles` into `user` where the user programs and user profiles reside in a single unit structure. More like the following:

- `user` contains profile directories. e.g `user/mmfallacy`
- `user/<profile>` contains a `home.nix`, a `const.nix` and user program configurations.
- `user/common` hosts the user program configurations I wish to share across profiles. Majority of these configurations should be set as `mkDefault`.
- `user/<profile>/**/<program>.nix` contains the profile-specific configuration (e.g. Git credentials, etc.) although it builds the configuration based of `user/common/**/<program>.nix`. The profile-specific config only overrides the default values.

## 4. Why do you have `home.nix` in machine-specific configuration?

`home.nix` in the machine-specific configuration add overrides on top of the base configuration (typically the associated `profiles/<profile>/home.nix`). This serves as the exact home-manager entry point, where I can define configuration overrides specific to the machine (e.g. Git signing keys, Default terminal, Machine-specific session variables).
