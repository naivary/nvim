local linter = {}

linter.markdown = { "vale", }
linter.go = { "staticcheck", }
linter.lua = { "luacheck", }
linter.proto = { "buf", }

return linter
