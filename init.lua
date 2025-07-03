-- Configuração do vim
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu rnu")
vim.g.mapleader = " "

-- Instalação do Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- TODO: Modularizar e adicionar descrições

-- Telescope configs
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {desc = 'Fuzy find'})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {desc = 'Live grep'})

-- Treesitter configs
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"python", "rust", "sql"},
	sync_install = false,
	highlight = {enable = true},
	indent = {enable = true}
})

-- Catppuccin configs
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin-mocha"

-- Neotree configs
vim.keymap.set('n', '<leader>e', ':Neotree filesystem toggle <CR>', {desc = 'Open filesystem', silent = true})

-- TODO configs
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set('n', '<leader>T', ':TodoTelescope<CR>' , {desc = 'Find TODOS'})
