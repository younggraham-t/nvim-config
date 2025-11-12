return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			setup = {
				jdtls = function ()
					return true
				end
			}
		},
		config = function ()

		end,
		lazy = false,
	}
}
