return {
    "williamboman/mason.nvim",
    dependencies = {
	    "WhoIsSethDaniel/mason-tool-installer.nvim"
    },
    lazy = false,
    config = function ()
    	local mason = require("mason")

	local mason_tool_installer = require("mason-tool-installer")

	mason.setup(

	)

	mason_tool_installer.setup({
		ensure_installed = {
			"eslint_d",
			"deno",
			"isort",
			"black",

		},
		run_on_start = true,
	})
    end
}
