return {
	'rebelot/terminal.nvim',
	config = function ()
		local term = require('terminal')
		term.setup {
			layout = { open_cmd = "float", height = "0.7", width = ".6"}
		}

	end
}
