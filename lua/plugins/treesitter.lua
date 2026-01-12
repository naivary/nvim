local function config()
	local ts = require("nvim-treesitter")
	local grammars = {
		"svelte",
		"html",
		"javascript",
		"typescript",
		"css",
		"python",
		"go",
		"gomod",
		"gosum",
		"bash",
		"sql",
	}
	ts.install(grammars)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = grammars,
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
