return {
  "rootiest/nvim-updater.nvim",
  version = "*", -- Pin to GitHub releases
  config = function()
    require("nvim_updater").setup({
      source_dir = "~/.local/src/neovim",  -- Custom target directory
      build_type = "RelWithDebInfo",       -- Set the desired build type
      branch = "release-0.11",             -- Track release v0.11
      check_for_updates = true,            -- Enable automatic update checks
      notify_updates = true,               -- Enables update notifications
      default_keymaps = false,             -- Disable default keymaps
    })
  end,
  keys = { -- Custom keymappings
    { -- Custom Update Neovim
      "<Leader>cuU",
      function()
        require('nvim_updater').update_neovim()
      end,
      desc = "Custom Update Neovim"
    },
  }
}
