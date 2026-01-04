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
	"ruff_organize_imports",
}
Formatter.sh = { "shfmt" }

Formatter.javascript = { "prettierd" }
Formatter.typescript = { "prettierd" }
Formatter.svelte = { "prettierd" }

return Formatter
