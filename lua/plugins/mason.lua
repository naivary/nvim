local function config()
	local lsp_config = require("naivary.lsp")
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
	require("mason-lspconfig").setup({
		ensure_installed = vim.tbl_keys(lsp_config.servers),
		automatic_installation = false,
	})

	vim.lsp.config("*", {
		capabilities = lsp_config.capabilities,
	})

	for lang_server, settings in pairs(lsp_config.servers) do
		settings.on_attach = lsp_config.on_attach
		vim.lsp.config(lang_server, settings)
		vim.lsp.enable(lang_server)
	end
	require("fidget").setup({})
end

return {
	"neovim/nvim-lspconfig",
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
		"nvim-telescope/telescope.nvim",
		"j-hui/fidget.nvim",
		"mhartington/formatter.nvim",
	},
	config = config,
}
