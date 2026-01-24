vim.g.mapleader = ","
vim.g.maplocalleader = ","
require("config.lazy")
-- vim.cmd[[colorscheme dracula-soft]]


require('kanagawa').load "wave"

vim.opt.number = true
vim.opt.relativenumber = true

-- set tabs to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4


-- enable line numbers and relative line numbers
vim.o.statuscolumn = "%s %l %r"

-- make jj map to esc
vim.keymap.set({'i'}, 'jj', '<esc>')

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


--quickly switch to buffer next and buffer previous
vim.keymap.set('n', '[b', ':bn<cr>')
vim.keymap.set('n', ']b', ':bp<cr>')
vim.keymap.set('n', 'bs', ':b #<cr>')


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
vim.o.updatetime = 250 -- Adjust this value for faster or slower pop-up
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


vim.lsp.enable('lua_ls')
vim.lsp.enable('typescript-language-server')
vim.lsp.enable('biome')
vim.lsp.config('jdtls', {
  cmd = { vim.fn.expand("$MASON/packages/jdtls/bin/jdtls") },
})
vim.lsp.enable('jdtls')
vim.lsp.enable("html-css")
vim.lsp.enable("css-lsp")
vim.lsp.enable("css-variables-language-server")
vim.lsp.enable("tailwindcss-language-server")
---------------------------------
-- Treesitter
---------------------------------


--------------------------------
-- Terminal
--------------------------------

-- auto enter insert mode when opening a terminal
-- vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
--     callback = function(args)
--         if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
--             vim.cmd("startinsert")
--         end
--     end,
-- })

-- highlight terminal
-- vim.api.nvim_create_autocmd("TermOpen", {
--     command = [[setlocal nonumber norelativenumber winhl=Normal:NormalFloat]]
-- })

-- local term_map = require('terminal.mappings')
--
-- -- vim.keymap.set({"n", "t"}, "<leader>tt", term_map.toggle({ open_cmd = "float", height = 0.9, width = 0.9 }))
-- vim.keymap.set({"n", "t"}, "<leader>tk", term_map.kill)
-- vim.keymap.set({"n", "t"}, "<leader>t]", term_map.cycle_next)
-- vim.keymap.set({"n", "t"}, "<leader>t[", term_map.cycle_prev)
--
vim.keymap.set({"t"}, "<C-k>", "<Up>")
vim.keymap.set({"t"}, "<C-j>", "<Down>")

--------------------------------------
--- BufferLine
--------------------------------------
vim.keymap.set("n", "gb", ":BufferLinePick<cr>")
vim.keymap.set("n", "gD", ":BufferLinePickClose<cr>")

