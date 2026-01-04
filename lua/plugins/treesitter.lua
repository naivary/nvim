local function config()
	local ts = require("nvim-treesitter")
	ts.install({
		"svelte",
		"html",
		"javascript",
		"typescript",
		"css",
		"go",
		"python",
	})
	vim.api.nvim_create_autocmd("FileType", {
		pattern = {
			"svelte",
			"javascript",
			"go",
			"python",
			"typescript",
			"css",
			"html",
		},
		callback = function()
			vim.treesitter.start()
		end,
	})
end
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = config,
}
