local function config()
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})

    require("telescope").setup({
        mappings = {
            i = {}
        },

        file_ignore_patterns = { "^.git/" },

        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case"
            }
        }
    })

    require("telescope").load_extension("fzf")
end

return { 
	"nvim-telescope/telescope.nvim",
    tag = "0.1.6", 
	dependencies = { 
		"nvim-lua/plenary.nvim", 
		"nvim-tree/nvim-web-devicons",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
	},
    config = config
}
	
