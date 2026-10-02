vim.keymap.set('n', "<leader>h", function () 
  vim.api.nvim_command("wincmd h")
end)

vim.keymap.set('n', "<leader>j", function ()
  vim.api.nvim_command("wincmd j")
end)

vim.keymap.set('n', "<leader>k", function ()
  vim.api.nvim_command("wincmd k")
end)

vim.keymap.set('n', "<leader>l", function ()
  vim.api.nvim_command("wincmd l")
end)

vim.keymap.set('n', "<leader>R", function ()
  vim.api.nvim_command("lsp restart")
  vim.print("LSP restarted")
end)

vim.keymap.set('n', "<leader>H", function ()
  vim.api.nvim_command("tabp")
end)

vim.keymap.set('n', "<leader>L", function ()
  vim.api.nvim_command("tabn")
end)
