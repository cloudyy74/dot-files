local M = {}


function M.setup()
-- Register per-server configs
local servers = {
pyright = require('lsp.servers.pyright'),
gopls = require('lsp.servers.gopls'),
rust_analyzer = require('lsp.servers.rust_analyzer'),
clangd = require('lsp.servers.clangd'),
}


local enabled = {}
for name, cfg in pairs(servers) do
-- vim.lsp.config / enable is your current API; keep it
vim.lsp.config(name, cfg)
table.insert(enabled, name)
end


vim.lsp.enable(enabled)
end


return M
