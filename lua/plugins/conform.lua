local function config()
    local conform = require("conform")
    conform.setup({
        formatters_by_ft = {
            go = { "golangci-lint" },
            lua = { "stylua" },
            markdown = { "deno_fmt" },
            json = { "jq" },
            yaml = { "yamlfmt" },
    })
    vim.keymap.set("n", "<leader>jf", function()
        conform.format({
            lsp_format = "fallback",
            timeout_ms = 2000,
            async = false,
        })
    end, { desc = "[F]ormat" })
end

return {
    "stevearc/conform.nvim",
    config = config,
}
