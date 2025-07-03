return {
	{ 
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000 
	},
	{
    'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
    dependencies = { 
			'nvim-lua/plenary.nvim' 
		}
  },
	{
		"nvim-treesitter/nvim-treesitter",
		branch = 'master',
		lazy = false,
		build = ":TSUpdate"
	},
	{
  	"nvim-neo-tree/neo-tree.nvim",
  	branch = "v3.x",
  	dependencies = {
  	  "nvim-lua/plenary.nvim",
  	  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  	  "MunifTanjim/nui.nvim",
  	  -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  	},
  	lazy = false, -- neo-tree will lazily load itself
  	---@module "neo-tree"
  	---@type neotree.Config?
  	opts = {
    	close_if_last_window = true,
			event_handlers = {
				{
					event = "file_opened",
					handler = function(file_path)
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
  	},
	},
	{
		"folke/which-key.nvim",
		dependencies = 'echasnovski/mini.icons',
		event = "VeryLazy",
		opts = {
			plugins = {
				spelling = {
					enabled = true,
				},
			},
			win = {
				border = "rounded",      -- bordas bonitas: none, single, double, shadow
				position = "right",      -- <- ESSENCIAL: mostra à direita
				margin = { 1, 0, 1, 1 }, -- cima, dir, baixo, esq
				padding = { 1, 2, 1, 2 }, -- espaço interno
			},
			layout = {
				height = { min = 4, max = 25 },  -- controla tamanho vertical
				width = { min = 20, max = 50 },  -- controla largura
				spacing = 4,                     -- espaço entre colunas
				align = "left",                  -- alinhamento dos atalhos
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
}
