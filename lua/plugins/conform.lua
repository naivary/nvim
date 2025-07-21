local function config()
	local conform = require("conform")
            conform.setup({})
	-- conform.setup({
	-- 	formatters_by_ft = {
	-- 		go = { "goimports-reviser", "gofumpt" },
	-- 		--lua = { "stylua" },
	-- 	},
	-- 	format_on_save = {
	-- 		lsp_format = "fallback",
	-- 		timeout_ms = 500,
	-- 		async = false,
	-- 	},
	-- })
	vim.keymap.set("n", "<leader>jf", function()
	 	conform.format({})
	 end, { desc = "[F]ormat" })
end

return {
	"stevearc/conform.nvim",
	config = config,
}
