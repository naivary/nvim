local function config()
    require("mason").setup()
    require("mason-lspconfig").setup(
        {
            "lua_ls",
            "gopls"
        }
    )
end

return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    },
    config = config
}
