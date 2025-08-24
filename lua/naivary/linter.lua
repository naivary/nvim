local Linter = {}
local golangcilint = require("lint").linters.golangcilint

golangcilint.args = {
    "run",
    "--output.json.path=stdout",
    "--show-stats=false",
    "--output.text.print-issued-lines=false",
    "--output.text.print-linter-name=false",
    function()
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":h")
    end,
}

Linter.go = { "golangcilint" }
Linter.markdown = { "vale" }

return Linter
