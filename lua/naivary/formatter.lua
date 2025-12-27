local Formatter = {}

Formatter.go = { "golangci-lint" }
Formatter.lua = { "stylua" }
Formatter.markdown = { "deno_fmt" }
Formatter.terraform = { "terraform" }
Formatter.json = { "jq" }
Formatter.yaml = { "yamlfmt" }
Formatter.python = {
    "ruff_fix",
    "ruff_format",
    "ruff_organize_imports"
}
Formatter.sh = { "shfmt" }


return Formatter
