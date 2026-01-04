local function config()
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
