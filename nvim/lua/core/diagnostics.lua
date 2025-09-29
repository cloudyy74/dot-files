-- Global diagnostics UI
vim.diagnostic.config({
underline = true,
virtual_text = false,
signs = true,
severity_sort = true,
update_in_insert = false,
float = {
border = "rounded",
source = "if_many",
header = "",
prefix = "",
focusable = false,
},
})


-- Pop-up on hover after short idle
vim.o.updatetime = 500
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
callback = function()
vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
end,
})


-- Buffer-local LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
callback = function(ev)
local map = function(mode, lhs, rhs, desc)
vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
end


map('n', '[d', function() vim.diagnostic.goto_prev({ float = false }) end, 'Prev diagnostic')
map('n', ']d', function() vim.diagnostic.goto_next({ float = false }) end, 'Next diagnostic')


map('n', '<leader>dv', function()
local cfg = vim.diagnostic.config()
vim.diagnostic.config({ virtual_text = not (cfg.virtual_text ~= false) })
vim.notify("Virtual text: " .. ((cfg.virtual_text ~= false) and "OFF" or "ON"))
end, 'Toggle virtual text')


map('n', '<leader>dl', vim.diagnostic.setloclist, 'Diagnostics to loclist')


map('n', 'K', vim.lsp.buf.hover, 'Hover')
map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
map('n', 'gr', vim.lsp.buf.references, 'References')
map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
map('n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
end,
})
