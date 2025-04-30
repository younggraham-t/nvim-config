
vim.g.mapleader = ","
vim.g.maplocalleader = ","
require("config.lazy")
-- vim.cmd[[colorscheme dracula-soft]]

require('kanagawa').load "wave"

vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set('i', '<esc>', '<nop>')

-- enable line numbers and relative line numbers
vim.o.statuscolumn = "%s %l %r"

-- make jj map to esc
vim.keymap.set('i', 'jj', '<esc>')

-- map leader w to write buffer to file
vim.keymap.set('n', '<leader>w', ':w!<cr>')

-- add better window navigation keybinds
vim.keymap.set('n', '<C-j>', '<C-W>j')
vim.keymap.set('n', '<C-k>', '<C-W>k')
vim.keymap.set('n', '<C-h>', '<C-W>h')
vim.keymap.set('n', '<C-l>', '<C-W>l')

-- remap 0 to first character
vim.keymap.set('n', '0', '^')

--set local paste
vim.keymap.set('n', '<leader>pp', ':setlocal paste!<cr>')

vim.keymap.set('n', '<leader>nn', ':Neotree<cr>')
-----------------------------------
-- LSPs
-----------------------------------

vim.diagnostic.config(
    {
        underline = true,
        virtual_text = true,
        update_in_insert = false,
        severity_sort = true,
        signs = {
            text = {
                -- Alas nerdfont icons don't render properly on Medium!
                [vim.diagnostic.severity.ERROR] = " ",
                [vim.diagnostic.severity.WARN] = " ",
                [vim.diagnostic.severity.HINT] = " ",
                [vim.diagnostic.severity.INFO] = " ",
            },
        },
    }
)

vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')

---------------------------------
-- LuaSnip
---------------------------------




--------------------------------
-- Diagnostics
--------------------------------
vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })



