-- [Signs](https://github.com/lucax88x/configs/blob/master/dotfiles/.config/nvim/lua/lt/lsp/init.lua)
--[[      󰝤   󰅚 󰀪 󰌶 ]]

vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.HINT] = "󰌶",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.WARN] = "󰀪",
			[vim.diagnostic.severity.ERROR] = "󰅚",
		},
	},
	underline = true,
	severity_sort = true,
})
