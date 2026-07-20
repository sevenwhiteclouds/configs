vim.pack.add({
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/williamboman/mason-lspconfig.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/hrsh7th/nvim-cmp",
  "https://github.com/hrsh7th/cmp-nvim-lsp",

  -- this is a telescope.nvim dependency
  "https://github.com/nvim-lua/plenary.nvim",

  ---- TODO: update treesitter to the new incompatible rewrite
  {src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master"},
  {src = "https://github.com/L3MON4D3/LuaSnip", vim.version.range("v2.x")},
  {src = "https://github.com/nvim-telescope/telescope.nvim", vim.version.range("v0.2.1")}
})
