My personal NeoVim config.

## Keybinds

```
<leader> is bound to ,
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

--toggle neotree on
vim.keymap.set('n', '<leader>nn', ':Neotree<cr>')

--trigger linting for current file 
<leader>l 

--toggle trouble (lsp diagnostics in depth)
<leader>xx
```

## Features

Plugins:
blink-cmp for code completion
Dracula color scheme
lualine for better statusline
luasnip for code snippets
mini-pairs for auto pairs
neotree for better file browsing
neotree-devicons to allow for icons
nvim comment (gcc for line comment gbc for block comment in normal mode)
nvim-lint 


LSP support for:
biome (tsserver + prettier)
eslint
ts ls (typescript language server)
lua ls
json
tailwind
pyright (python)


