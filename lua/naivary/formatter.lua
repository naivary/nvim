local Formatter = {}

Formatter.go = { "golangci-lint" }
Formatter.lua = { "stylua" }
Formatter.markdown = { "deno_fmt" }
Formatter.tf = { "terraform" }
Formatter.py = { "black" }

return Formatter
