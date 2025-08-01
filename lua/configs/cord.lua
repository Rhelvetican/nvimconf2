---@alias CordDisplayer fun(opts: CordOpts): string

---@param opts CordOpts
---@return string
local oldschool = function(opts)
	return "Being oldschool in " .. opts.filename
end

---@type table<string, CordDisplayer>
local languages = {
	["c"] = oldschool,
	["cpp"] = oldschool,
	["h"] = oldschool,
	["hpp"] = oldschool,
	["objc"] = oldschool,
	["objcpp"] = oldschool,

	["rust"] = function(opts)
		return "Oxidizing " .. opts.filename
	end,

	["lua"] = function(opts)
		return "Writing cool lua code at " .. opts.filename
	end,

	["zig"] = function(opts)
		return "Zigging at " .. opts.filename
	end,

	["python"] = function(opts)
		return "Slithering around at " .. opts.filename
	end,
}

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
			local handle = languages[opts.filetype]
			if handle then
				return handle(opts)
			else
				return "Editing " .. opts.filename
			end
		end,

		---@param opts CordOpts
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
