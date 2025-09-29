-- leaders & basic UI
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


require('core.options') -- numbers, tabs, colors, etc.
require('core.diagnostics') -- diagnostic config + autocommands


-- LSP bootstrap (register + enable per server)
require('lsp').setup()
