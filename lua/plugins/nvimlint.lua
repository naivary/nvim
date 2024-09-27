local function config()
    local linter = require("naivary.linter")
    local lint = require("lint")
    lint.linters_by_ft = linter
end

return {
    "mfussenegger/nvim-lint",
    config = config
}
