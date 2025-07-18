local Harpoon = {}

local map = function(mode, keys, func, desc)
    if desc then
        desc = "Harpoon: " .. desc
    end
    require("util.keymap").map(mode, keys, func, { desc = desc })
end

local function toggle_telescope(harpoon_files)
    local conf = require("telescope.config").values
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
end

local function key_maps(harpoon)
    map("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, "Open harpoon window")

    map("n", "<leader>a", function() harpoon:list():add() end)
    map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    map("n", "<C-h>", function() harpoon:list():select(1) end)
    map("n", "<C-t>", function() harpoon:list():select(2) end)
    map("n", "<C-n>", function() harpoon:list():select(3) end)
    map("n", "<C-s>", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    map("n", "<C-S-P>", function() harpoon:list():prev() end)
    map("n", "<C-S-N>", function() harpoon:list():next() end)
end


Harpoon.key_maps = key_maps

return Harpoon
