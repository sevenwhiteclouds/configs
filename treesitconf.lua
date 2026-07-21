require("tree-sitter-manager").setup({
  auto_install = true,
  ensure_installed = {
    "cpp",
    "java",
    "javascript",
    "python",
    "c",
    "html",
    "css",
    "dockerfile",
    "bash",
    "markdown",
    "lua",
    "vimdoc",
    "sql"
  },
})

-- pull up the manager
vim.keymap.set("n", "<leader>t", function()
  vim.cmd("TSManager")
end)

-- update all parsers
vim.keymap.set("n", "<leader>u", function()
  vim.cmd("TSUpdate!")
end)
