return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	opts = function()
		---@type {[string]: fun(opts: CordOpts): string}
		Languages = {}

		Languages["Rust"] = function(o)
			return "Oxidizing " .. o.filename .. " (Line " .. o.cursor_line .. ")"
		end

		Languages["Zig"] = function(o)
			return "Zigging " .. o.filename .. " (Line " .. o.cursor_line .. ")"
		end

		Languages["Lua"] = function(o)
			return "Writing (probably) awesome Lua at " .. o.filename .. " (Line " .. o.cursor_line .. ")"
		end

		Languages["rust"] = Languages["Rust"]
		Languages["zig"] = Languages["Zig"]
		Languages["lua"] = Languages["Lua"]

		require("cord").setup({
			editor = {
				client = "neovim",
				tooltip = "The Holy Text Editor",
			},

			display = {
				theme = "catppuccin",
				flavor = "accent",
			},

			text = {
				editing = function(o)
					vim.notify(o.filetype, 1, {})
					if Languages[o.filetype] ~= nil then
						return Languages[o.filetype](o)
					end

					return "Editing " .. o.filename
				end,

				workspace = function(o)
					return "Working on " .. o.workspace
				end,
			},
		})
	end,
}
