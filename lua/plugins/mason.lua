local function config()
    local lsp_config = require("naivary.lsp")
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(lsp_config.servers),
        automatic_installation = false,
    })
    require("mason-lspconfig").setup_handlers({
        function(server_name)
            require("lspconfig")[server_name].setup({
                on_attach = lsp_config.on_attach,
                capabilities = lsp_config.capabilities,
            })
        end,
    })
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
    },
    config = config,
}
