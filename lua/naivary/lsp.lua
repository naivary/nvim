local _, telescope = pcall(require, "telescope.builtin")
local formatter = require("naivary.formatter")

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

    marksman = {}
}

function LSP.on_attach(_, bufnr)
    local lint = require("lint")
    local map = function(mode, keys, func, desc)
        if desc then
            desc = "LSP: " .. desc
        end
        require("util.keymap").map(mode, keys, func, { buffer = bufnr, desc = desc })
    end

    map("n", "<leader>jf", function()
        local format = formatter[vim.bo.filetype] or vim.lsp.buf.format
        format()
    end, "[F]ormat")

    map("n", "<leader>jl", function()
        lint.try_lint()
    end, "[L]int")

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
