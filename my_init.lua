-- set my leader to be <space?>
-- this has it's own lua function
-- the 'vim.g' means i'm perfoming this globally as opposed to in a specific window or buffer
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- set numbers and relative numbers. 
-- 'opt' is used for setting vim options in lua.
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

-- set the indentation to be 4
vim.opt.shiftwidth = 4

vim.keymap.set("n", "<space><space>x", "<CMD>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- create the function to highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when copying (yanking) text',
    group =vim.api.nvim_create_augroup('kickstart-highlight-yank', {clear = true}), 
    callback = function()
	vim.highlight.on_yank()
    end,
})

require("config.lazy")
