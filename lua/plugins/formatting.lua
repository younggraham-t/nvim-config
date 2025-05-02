return { "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "deno" },
        typescript = { "deno" },
        javascriptreact = { "deno" },
        typescriptreact = { "deno" },
        css = { "biome" },
        html = { "biome" },
        json = { "deno" },
        markdown = { "deno" },
        lua = { "stylua" },
        python = { "isort", "black" },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>ff", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
