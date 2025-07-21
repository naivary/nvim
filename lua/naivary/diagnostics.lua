-- [Signs](https://github.com/lucax88x/configs/blob/master/dotfiles/.config/nvim/lua/lt/lsp/init.lua)

--[[      󰝤   󰅚 󰀪 󰌶 ]]
--

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    severity_sort = true,
})

local column_signs = {
    { name = "DiagnosticSignError", text = "󰅚" },
    { name = "DiagnosticSignWarn", text = "󰀪" },
    { name = "DiagnosticSignHint", text = "󰌶" }, --
    { name = "DiagnosticSignInfo", text = "" },
}

-- setup signs
for _, sign in ipairs(column_signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
