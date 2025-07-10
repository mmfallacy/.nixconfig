# Known discrepancies when migrating from `nix` to `lix`

- Pipe operators experimental feature: Nix (`pipe-operators`); Lix (`pipe-operator`)[^1]
  > [!NOTE]
  > Enabling both `pipe-operators` and `pipe-operator` within your configuration will result into a failed evaluation.

[^1]: https://discourse.nixos.org/t/lix-mismatch-in-feature-name-compared-to-nix/59879
