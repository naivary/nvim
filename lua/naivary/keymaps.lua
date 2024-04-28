local map = require("util.keymap").map
local nmap = require("util.keymap").nmap
local imap = require("util.keymap").imap
local vmap = require("util.keymap").vmap
local xmap = require("util.keymap").xmap

imap("jk", "<Esc>", { desc = "close insert mode"})

nmap("<leader>p", ":bprevious<CR>", { desc = "previous buffer ([B]ack)" })
nmap("<leader>n", ":bnext<CR>", { desc = "[N]ext buffer" })
nmap("<leader>q", ":bdelete<CR>", { desc = "[Q]uit buffer" })
nmap("<leader>!q", ":bdelete!<CR>", { desc = "[Q]uit buffer[!]" })

