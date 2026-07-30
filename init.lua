local profile = vim.env.NVIM_PROFILE or "stock"

if not (profile == "stock") then
  vim.g.mapleader = " "

  require("opts")
  require("keymaps")
  require("cmds")
end

-- plenary.nvim is a telescope.nvim dependency
if profile == "minimal" then
  vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    {src = "https://github.com/nvim-telescope/telescope.nvim", vim.version.range("v0.2.1")},
    "https://github.com/romus204/tree-sitter-manager.nvim"
  })

  require("telescopeconf")
  require("treesitconf")
elseif profile == "full" then
  vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    {src = "https://github.com/nvim-telescope/telescope.nvim", vim.version.range("v0.2.1")},

    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",

    "https://github.com/romus204/tree-sitter-manager.nvim"
  })

  require("telescopeconf")
  require("masonconf")
  require("lspconfig")
  require("treesitconf")
end
