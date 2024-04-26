local keymap = {}

---@param mode string|string[] Mode short-name, see |nvim_set_keymap()|. Can also be list of modes to create mapping on multiple modes.
---@param lhs string Left-hand side |{lhs}| of the mapping.
---@param rhs string|fun() Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts? KeymapOpts Table of |:map-arguments|.
function keymap.map(mode, lhs, rhs, opts)
    return vim.keymap.set(mode, lhs, rhs, opts)
end

---@param lhs string Left-hand side |{lhs}| of the mapping.
---@param rhs string|fun() Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts? KeymapOpts Table of |:map-arguments|.
function keymap.nmap(lhs, rhs, opts) return keymap.map("n", lhs, rhs, opts) end

---@param lhs string Left-hand side |{lhs}| of the mapping.
---@param rhs string|fun() Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts? KeymapOpts Table of |:map-arguments|.
function keymap.imap(lhs, rhs, opts) return keymap.map("i", lhs, rhs, opts) end

---@param lhs string Left-hand side |{lhs}| of the mapping.
---@param rhs string|fun() Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts? KeymapOpts Table of |:map-arguments|.
function keymap.vmap(lhs, rhs, opts) return keymap.map("v", lhs, rhs, opts) end

---@param lhs string Left-hand side |{lhs}| of the mapping.
---@param rhs string|fun() Right-hand side |{rhs}| of the mapping, can be a Lua function.
---@param opts? KeymapOpts Table of |:map-arguments|.
function keymap.xmap(lhs, rhs, opts) return keymap.map("x", lhs, rhs, opts) end

return keymap
