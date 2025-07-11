-- Configuração do vim
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nu rnu")
vim.g.mapleader = " "
vim.env.PATH = "C:\\Users\\Reserva\\scoop\\apps\\nodejs\\current;" .. vim.env.PATH

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
require("config.keymaps")
