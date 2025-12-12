local function config()
    local lint = require("lint")
    local linter = require("naivary.linter")
    lint.linters_by_ft = linter
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
        group = lint_augroup,
        callback = function()
            lint.try_lint()
        end,
    })

    vim.keymap.set("n", "<leader>lf", function()
        lint.try_lint()
    end, { desc = "Trigger linting for current file" })
end

return {
    "mfussenegger/nvim-lint",
    config = config,
}
