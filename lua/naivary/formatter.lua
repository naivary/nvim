local Formatter           = {}

Formatter.lua             = { "stylua" }
Formatter.json            = { "jq" }
Formatter.python          = {
    "ruff_fix",
    "ruff_format",
    "ruff_organize_imports",
}

Formatter.sh              = { "shfmt" }

Formatter.yaml            = { "prettierd" }
Formatter.javascript      = { "prettierd" }
Formatter.typescript      = { "prettierd" }
Formatter.svelte          = { "prettierd" }
Formatter.css             = { "prettierd" }
Formatter.markdown        = { "prettierd" }
Formatter.markdown_inline = { "prettierd" }

Formatter.sql             = { "pg_format" }

return Formatter
