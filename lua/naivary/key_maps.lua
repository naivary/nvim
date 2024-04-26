local map = require("util.key_maps").map
local nmap = require("util.key_maps").nmap
local imap = require("util.key_maps").imap
local vmap = require("util.key_maps").vmap
local xmap = require("util.key_maps").xmap

imap("jk", "<Esc>", { desc = "close insert mode"})

nmap("<leader>p", ":bprevious<CR>", { desc = "previous buffer ([B]ack)" })
nmap("<leader>n", ":bnext<CR>", { desc = "[N]ext buffer" })
nmap("<leader>q", ":bdelete<CR>", { desc = "[Q]uit buffer" })
nmap("<leader>!q", ":bdelete!<CR>", { desc = "[Q]uit buffer[!]" })

