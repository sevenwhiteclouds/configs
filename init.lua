local profile = vim.env.NVIM_PROFILE or "stock"

if not (profile == "stock") then
  vim.g.mapleader = " "

  require("opts")
  require("keymaps")
  require("cmds")
end

-- plenary is a telescope.nvim dependency
if profile == "minimal" then
  vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    {src = "https://github.com/nvim-telescope/telescope.nvim", vim.version.range("v0.2.1")}
  })

  require("telescopeconf")
elseif profile == "full" then
  vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    {src = "https://github.com/nvim-telescope/telescope.nvim", vim.version.range("v0.2.1")},

    "https://github.com/williamboman/mason.nvim",
    "https://github.com/williamboman/mason-lspconfig.nvim",

    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/hrsh7th/cmp-nvim-lsp",

    "https://github.com/hrsh7th/nvim-cmp",
    {src = "https://github.com/L3MON4D3/LuaSnip", vim.version.range("v2.x")},

    "https://github.com/romus204/tree-sitter-manager.nvim"
  })

  require("telescopeconf")
  require("masonconf")
  require("lspconfig")
  require("autocmp")
  require("treesitconf")
end
