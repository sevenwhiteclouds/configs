-- remove default lsp keymaps to set custom ones on lsp attach
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")

vim.opt.autocomplete = true
vim.opt.completeopt = {"menuone", "popup", "noselect"}

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- disable color highlighting from LSP. this method works with both
    -- servers that obey and don't obey client capabilities because it doesn't
    -- let neovim start the semantic tokens engine
    client.server_capabilities.semanticTokensProvider = nil

    vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})

    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, {buffer = args.buf})

    -- show a list of all the places where what is under the cursor is used
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = args.buf})

    -- show a list of all implementations of an interface or abstract methods/classes
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = args.buf})

    -- show a list of  symbols (variables, functions, classes, methods, etc.)
    -- in the current file, makes navigation easier
    vim.keymap.set("n", "go", vim.lsp.buf.document_symbol, {buffer = args.buf})

    -- go to where type is defined, typically in header files, for example
    vim.keymap.set("n", "gO", vim.lsp.buf.type_definition, {buffer = args.buf})

    -- show where a symbol is declared, but not necessarily defined
    -- the difference between int num; and num = 5;
    -- NOTE: many servers do not implement this method, use definition instead
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = args.buf})

    -- show where a symbol is defined and not just declared
    -- declared and defined are often in the same location, but not always
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = args.buf})
  end,
})

-- use enter to accept suggestion
vim.keymap.set("i", "<CR>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-y>"
  end

  return "<CR>"
end, {expr = true})

-- use control-space to manually pull up suggestion
vim.keymap.set("i", "<C-Space>", function()
  vim.lsp.completion.get()
end)

-- make lsp warnings less annoying by delaying warnings in normal mode
vim.opt.updatetime = 1300
vim.diagnostic.enable(false)

vim.api.nvim_create_autocmd({"CursorHold"}, {
  desc = "Diagnostics on",
  callback = function()
    vim.diagnostic.enable(true)
  end,
})

vim.api.nvim_create_autocmd({"TextChanged", "InsertEnter"}, {
  desc = "Diagnostics off",
  callback = function()
    vim.diagnostic.enable(false)
  end,
})
