-- Show diagnostics in a floating window
vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<CR>')

-- Move to the previous diagnostic
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

-- Move to the next diagnostic
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
