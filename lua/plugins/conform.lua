local function config()
	local conform = require("conform")
	conform.setup({
		formatters = {
			["goimports-reviser"] = {
				args = {
					"-rm-unused",
					"-set-alias",
					"-format",
					"$FILENAME",
				},
			},
		},
		formatters_by_ft = {
			go = { "golangci-lint" },
			lua = { "stylua" },
			markdown = { "deno_fmt" },
		},
	})

	vim.keymap.set("n", "<leader>jf", function()
		conform.format({
			lsp_format = "fallback",
			timeout_ms = 500,
			async = false,
		})
	end, { desc = "[F]ormat" })
end

return {
	"stevearc/conform.nvim",
	config = config,
}
