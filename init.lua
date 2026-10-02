-- Set leader key
vim.g.mapleader = " "
-- vim.o.background = nil
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")


vim.cmd("filetype plugin indent on")
vim.cmd("set number relativenumber")
-- vim.cmd("colorscheme NeoCyberVim")
vim.cmd("set mouse=a")
vim.cmd("syntax on")
vim.opt.hlsearch = false
vim.opt.termguicolors = true


require("NeoCyberVim").setup({
	transparent = true,
	italics = {
		comments = false,
		keywords = false,
		functions = false,
		variables = false,
		strings = false,
	},
})

require("NeoCyberVim").colorscheme()
require("config.indent")
require("config.binds")
