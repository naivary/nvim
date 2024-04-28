vim.g.mapleader = " "       -- <leader> is defined as a whitespace

vim.opt.number = true         -- line: show line numbers
vim.opt.relativenumber = true -- line: show relative line numbers

vim.opt.tabstop = 4           -- tab: tab char length
vim.opt.expandtab = true      -- tab: convert tab to spaces
vim.opt.softtabstop = 4       -- tab: convert tab to spaces
vim.opt.shiftwidth = 4        -- tab: indentation length

vim.opt.errorbells = false    -- audio: no bells

vim.opt.swapfile = false      -- swap: buffer in memory not swap
vim.opt.backup = false        -- backup: no backup of edited file
vim.opt.undofile = true                             -- backup: store undo buffer in file

local home = require("util.paths").paths.home 
vim.opt.undodir =  home .. "/.vim/undo"             -- backup: store undofiles in ~/.vim/undo

vim.opt.clipboard = "unnamedplus" -- clipboard: shared with OS
