local M = {}

local home = vim.fn.expand("~")
local nvim_data = vim.fn.stdpath("data")

M.paths = {
    home = home,
    nvim_data = nvim_data,
    mason = nvim_data .. "/mason"
}

return M
