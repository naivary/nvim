local function config()
	local augroup = vim.api.nvim_create_augroup
	local autocmd = vim.api.nvim_create_autocmd
	augroup("__formatter__", { clear = true })
	autocmd("BufWritePost", {
		group = "__formatter__",
		command = ":FormatWrite",
	})

	require("formatter").setup({
		filetype = {
			lua = {
				require("formatter.filetypes.lua").stylua,
			},
			go = {
				require("formatter.filetypes.go").gofmt,
				require("formatter.filetypes.go").goimports,
			},
		},
	})
end

return {
	"mhartington/formatter.nvim",
	config = config,
}
