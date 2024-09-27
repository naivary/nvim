local linter = {}

linter.markdown = { "vale", }
linter.go = { "golangcilint", }
linter.lua = { "luacheck", }

return linter
