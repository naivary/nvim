local function config()
    local harpoon = require('harpoon')
    harpoon:setup({})
    local c = require("naivary.harpoon2")
    c.key_maps(harpoon)
end

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = config,
}
