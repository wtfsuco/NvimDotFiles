return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 
		'nvim-lua/plenary.nvim' 
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set('n', '<leader><leader>', builtin.find_files, {desc = 'Fuzy find'})
		vim.keymap.set('n', '<leader>g', builtin.live_grep, {desc = 'Live grep'})
	end
}
