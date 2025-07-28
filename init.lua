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

--toggle neotree
vim.keymap.set('n', '<leader>nn', ':Neotree toggle<cr>')


vim.keymap.set('n', '<leader>em', ':!mvn exec:java -Dexec.mainClass=com.younggrahamt.App<cr>')

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
vim.lsp.enable('deno')
vim.lsp.enable('biome')
vim.lsp.enable('jdtls')
---------------------------------
-- LuaSnip
---------------------------------




--------------------------------
-- Diagnostics
--------------------------------
vim.keymap.set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true })

--------------------------------
-- Terminal
--------------------------------
--creates a terminal object call lazygit that launches lazygit when opened
local lazygit = require("terminal").terminal:new({
    layout = { open_cmd = "float", height = 0.9, width = 0.9 },
    cmd = { "lazygit" },
    autoclose = true,
})


-- creates a command :Lazygit that toggles the lazygit terminal on and off
vim.env["GIT_EDITOR"] = "nvr -cc close -cc split --remote-wait +'set bufhidden=wipe'"
vim.api.nvim_create_user_command("Lazygit", function(args)
    lazygit.cwd = args.args and vim.fn.expand(args.args)
    lazygit:toggle(nil, true)
end, { nargs = "?" })

-- maps to the Lazygit terminal command
vim.keymap.set("n", "<leader>tg", ":Lazygit<cr>")



-- auto enter insert mode when opening a terminal
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
    callback = function(args)
        if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
            vim.cmd("startinsert")
        end
    end,
})

local term_map = require('terminal.mappings')

vim.keymap.set({"n", "t"}, "<leader>tt", term_map.toggle({ open_cmd = "float", height = 0.9, width = 0.9 }))
vim.keymap.set({"n", "t"}, "<leader>tk", term_map.kill)
vim.keymap.set({"n", "t"}, "<leader>t]", term_map.cycle_next)
vim.keymap.set({"n", "t"}, "<leader>t[", term_map.cycle_prev)

--------------------------------------
--- BufferLine
--------------------------------------
vim.keymap.set("n", "gb", ":BufferLinePick<cr>")
vim.keymap.set("n", "gD", ":BufferLinePickClose<cr>")
