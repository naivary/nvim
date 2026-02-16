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
        attach_mappings = function(prompt_bufnr, map_telescope)
            map_telescope("n", "<leader>r", function()
                local state = require("telescope.actions.state")
                local selected_entry = state.get_selected_entry()
                local current_picker = state.get_current_picker(prompt_bufnr)
                -- Remove from harpoon list
                harpoon_files:remove_at(selected_entry.index)
                -- Refresh the picker
                current_picker:refresh(
                    require("telescope.finders").new_table({
                        results = vim.tbl_map(function(item) return item.value end, harpoon_files.items)
                    }),
                    { reset_prompt = false }
                )
            end)
            return true
        end,
    }):find()
end

local function key_maps()
    local harpoon = require("harpoon")
    map("n", "<leader>ee", function() toggle_telescope(harpoon:list()) end, "Open harpoon window")

    map("n", "<leader>a", function() harpoon:list():add() end)
    map("n", "<leader>r", function() harpoon:list():remove() end)
    map("n", "<leader>cl", function() harpoon:list():clear() end)

    map("n", "<C-t>", function() harpoon:list():select(1) end)
    map("n", "<C-s>", function() harpoon:list():select(2) end)
    map("n", "<C-n>", function() harpoon:list():select(3) end)
    map("n", "<C-l>", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    map("n", "<C-S-P>", function() harpoon:list():prev() end)
    map("n", "<C-S-N>", function() harpoon:list():next() end)
end


Harpoon.key_maps = key_maps

return Harpoon
