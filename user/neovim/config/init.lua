if vim.env.IS_NIXOS ~= nil then
  return vim.notify(
    "You are currently running in a NixOS environment.
    This init.lua manually installs lazy.nvim,
    which might lead to an impure Nix configuration.",
    vim.log.levels.ERROR
  )
end

# From https://lazy.folke.io/installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("custom.options")
require("custom.keybinds")
require("lazy").setup({ import = "custom.plugins" })

