
vim.g.mapleader = ","
vim.g.maplocalleader = ","
require("config.lazy")


vim.cmd[[colorscheme dracula-soft]]

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
local ts_server = vim.g.lsp_typescript_server or "ts_ls" -- "ts_ls" or "vtsls" for TypeScript

-- Enable LSP servers for Neovim 0.11+
vim.lsp.enable {
ts_server,
"lua_ls", -- Lua
"biome", -- Biome = Eslint + Prettier
"json", -- JSON
"pyright", -- Python
-- "gopls", -- Go
"tailwindcss", -- Tailwind CSS
}

-- Load Lsp on-demand, e.g: eslint is disable by default
-- e.g: We could enable eslint by set vim.g.lsp_on_demands = {"eslint"}
if vim.g.lsp_on_demands then
vim.lsp.enable(vim.g.lsp_on_demands)
end


---------------------------------
-- LuaSnip
---------------------------------
