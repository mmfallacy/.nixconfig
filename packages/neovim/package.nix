{
  pkgs,
  extras,
  ...
}:
extras.mnw.lib.wrap pkgs {
  neovim = pkgs.neovim-unwrapped;
  initLua = ''
    vim.print("This is neovim wrapped via mnw")
  '';
}
