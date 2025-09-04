vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true 

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch=false
vim.opt.incsearch=true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
--vim.opt.colorcolumn = "80"
vim.g.mapleader = " "
--vim.opt.textwidth = 80
---- ~/.config/nvim/lua/config/options.lua
vim.opt.termguicolors = true -- Enable 24-bit RGB colors (required for most colorschemes)
vim.opt.winblend = 0         -- Transparency for floating windows (0 = fully opaque, 100 = fully transparent)
vim.opt.pumblend = 0         -- Transparency for popup menus

vim.opt.guicursor = "i:block"
