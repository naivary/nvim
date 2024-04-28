local map = require("util.keymaps").map
local nmap = require("util.keymaps").nmap
local imap = require("util.keymaps").imap
local vmap = require("util.keymaps").vmap
local xmap = require("util.keymaps").xmap

imap("jk", "<Esc>", { desc = "close insert mode"})

nmap("<leader>p", ":bprevious<CR>", { desc = "previous buffer ([B]ack)" })
nmap("<leader>n", ":bnext<CR>", { desc = "[N]ext buffer" })
nmap("<leader>q", ":bdelete<CR>", { desc = "[Q]uit buffer" })
nmap("<leader>!q", ":bdelete!<CR>", { desc = "[Q]uit buffer[!]" })

