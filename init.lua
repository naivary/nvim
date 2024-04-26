local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
require("lazy").setup({
    { import = "plugins" },
    {
        defaults = {
            lazy = true
        }
    }
})

local plugins = {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {}
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make"
	}
}
local opts = {}
require("lazy").setup(plugins, opts)
vim.cmd.colorscheme "tokyonight-storm"

-- tree sitter
local tsConfig = require("nvim-treesitter.configs")
tsConfig.setup({
	ensure_installed = { "go", "rust", "lua" },
	highlight = { enable = true },
	indent = { enable = true }
})

-- telescope
require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = false,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case"
		}	
	}
})
require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
