local profile = vim.env.NVIM_PROFILE or "stock"

if not (profile == "stock") then
  vim.g.mapleader = " "

  require("opts")
  require("keymaps")
  require("cmds")
end

if profile == "minimal" or profile == "full" then
  require("pack")
  --require("lazyconf")
  require("telescopeconf")
end

if profile == "full" then
  require("masonconf")
  require("lspconfig")
  require("treesitconf")
  require("autocmp")
end
