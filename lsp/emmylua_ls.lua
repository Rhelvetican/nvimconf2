return {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				pathStrict = false,
				requirePattern = { "lua/?.lua", "lua/?/init.lua" },
			},
			workspace = {
				library = {},
				checkThirdParty = false,
				ignoreDir = {},
			},
		},
	},
}
