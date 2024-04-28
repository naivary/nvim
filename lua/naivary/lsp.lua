local create_autocmd = require("util.autocmd")
local create_augroup = require("util.augroup")
local _, telescope = pcall(require, "telescope.builtin")

local LSP = {}

LSP.servers = {
    lua_ls = {
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",                                         -- Lua version (LuaJIT for Neovim)
                    path = vim.split("?.lua;?/init.lua;" .. package.path, ";"), -- Setup your lua path
                },
                diagnostics = {
                    globals = { "vim" }, -- recognize the `vim` global
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {
                        vim.fn.expand("$VIMRUNTIME/lua"),
                        vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                        vim.fn.expand("~/bin/awesome"),
                    },
                    checkThirdParty = false,
                },
                telemetry = { enable = false },
            },
        },
    },
    gopls = {
        settings = {
            gopls = {
                allExperiments = true,
                staticcheck = true,
                gofumpt = true,
            },
        },
    },
}

-- formatters
local formatters = {
    -- this is using the gopls to automatically also ogranize the imports which can not be set via settings
    go = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        -- buf_request_sync defaults to a 1000ms timeout. Depending on your
        -- machine and codebase, you may want longer. Add an additional
        -- argument after params if you find that you have to write the file
        -- twice for changes to be saved.
        -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end
}

function LSP.on_attach(_, bufnr)
    local map = function(mode, keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end
        require("util.keymap").map(mode, keys, func, { buffer = bufnr, desc = desc })
    end

    -- auto formatting on save
    create_autocmd("BufWritePre", {
        group = create_augroup("LspFormatting", {}),
        buffer = bufnr,
        callback = function()
            local format = formatters[vim.bo.filetype] or vim.lsp.buf.format
            format()
        end
    })

    map("n", "<leader>jn", function()
        vim.lsp.buf.rename()
    end, "Re[n]ame")
    map("n", "<leader>ja", function()
        vim.lsp.buf.code_action()
    end, "Code [A]ction")
    map("n", "<leader>jd", function()
        vim.diagnostic.open_float()
    end, "Show [D]iagnostics")

    map("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    -- map("n", "gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    -- map("n", "<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    map("n", "gd", function()
        telescope.lsp_definitions()
    end, "[G]oto [D]efinition")
    map("n", "gI", function()
        telescope.lsp_implementations()
    end, "[G]oto [I]mplementation")
    map("n", "gD", function()
        vim.lsp.buf.declaration()
    end, "[G]oto [D]eclaration")
    map("n", "gr", function()
        telescope.lsp_references()
    end, "[G]oto [R]eferences")

    map("n", "K", function()
        vim.lsp.buf.hover()
    end, "[H]over Documentation")

    map("n", "<C-S-h>", function()
        vim.lsp.buf.signature_help()
    end, "Signature Documentation")

    map("n", "<leader>nd", function()
        vim.diagnostic.goto_next()
    end, "[N]ext [D]iagnostic")
    map("n", "<leader>bd", function()
        vim.diagnostic.goto_prev()
    end, "previous [D]iagnostic")
    map("n", "<leader>ne", function()
        telescope.diagnostics({ severity_limit = 1 })
    end, "[N]ext [E]rror")
    map("n", "<leader>be", function()
        telescope.diagnostics({ severity_limit = 1 })
    end, "previous [E]rror")

    map("n", "<leader>ds", function()
        telescope.lsp_document_symbols()
    end, "[D]ocument [S]ymbols")
    map("n", "<leader>ws", function()
        telescope.lsp_dynamic_workspace_symbols()
    end, "[W]orkspace [S]ymbols")

    map("n", "<leader>se", function()
        vim.diagnostic.open_float({ bufnr = bufnr })
    end, "[S]how [E]rror")


    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
            underline = true,
            signs = true,
        }
    )
end

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
LSP.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return LSP
