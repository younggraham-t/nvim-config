local lint_progress = function()
  local linters = require("lint").get_running()
  print(linters)
  if #linters == 0 then
      return "󰦕"
  end
  return "󱉶 " .. table.concat(linters, ", ")
end

return {
	"nvim-lualine/lualine.nvim",
	opts= {
	},
	config = function ()
		require("lualine").setup {
		  sections = {
		    lualine_a = {'mode'},
		    lualine_b = {'branch', 'diff', 'diagnostics'},
		    lualine_c = {'filename'},
		    lualine_d = {lint_progress},
		    lualine_e = {'lsp_status'},
		    lualine_x = {'encoding', 'fileformat', 'filetype'},
		    lualine_y = {'progress'},
		    lualine_z = {'location'}
		  },
		}
	end
}
