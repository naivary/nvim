local function config()
	local conform = require("conform")
	local formatter = require("naivary.formatter")
	conform.setup({
		formatters_by_ft = formatter,
	})
	vim.keymap.set("n", "<leader>jf", function()
		conform.format({
			lsp_format = "fallback",
			async = true,
		})
	end, { desc = "[F]ormat" })
end

return {
	"stevearc/conform.nvim",
	config = config,
}
