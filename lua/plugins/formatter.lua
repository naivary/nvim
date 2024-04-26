local function config()
    require("formatter").setup({
        filetype = {
            lua = {
                require("formatter.filetypes.lua").stylua
            },
            go = {
                require("formatter.filetypes.go").gofmt
            }
        }
    })
end

return {
    "mhartington/formatter.nvim",
    config = config
}
