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
		tooltip = "The Supreme Text Editor",
	},

	display = {
		theme = "catppuccin",
		flavor = "accent",
	},

	text = {
		editing = function(opts)
			local handle = Languages[opts.filetype]

			if handle ~= nil then
				return handle(opts)
			else
				return "Editing " .. opts.filename
			end
		end,

		workspace = function(opts)
			local diagnostics = #vim.diagnostic.get(vim.api.nvim_get_current_buf())
			return "Fixing " .. diagnostics .. diagnostics < 2 and " bug " or " bugs " .. "in" .. opts.filename
		end,

		docs = "Reading docs...",
		vcs = "Managing git...",
	},

	assets = {
		["Cargo.toml"] = {
			text = "Managing Cargo dependencies...",
		},

		["pyproject.toml"] = {
			text = "Managing Python project...",
		},
	},
})
