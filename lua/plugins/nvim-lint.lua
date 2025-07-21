local function config()
    local lint = require("lint")
    lint.linters_by_ft = {
        go = { "golangcilint" }
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
        group = lint_augroup,
        pattern = { "*.go" },
        callback = function()
            lint.try_lint()
        end,
    })
end

return {
    "mfussenegger/nvim-lint",
    config = config,
}
