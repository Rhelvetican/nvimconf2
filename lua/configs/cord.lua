local oldschool = function(opts)
	return "Being oldschool in " .. opts.filename
end

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

		---@module "cord"
		---@param opts CordOpts
		workspace = function(opts)
			local diagnostics
			if opts.diagnostics then
				diagnostics = opts.diagnostics(opts)
			else
				diagnostics = nil
			end

			if diagnostics ~= nil then
				if diagnostics > 1 then
					return "In " .. opts.workspace_name .. " with " .. diagnostics .. " problems."
				else
					return "In " .. opts.workspace_name .. " with " .. diagnostics .. " problem."
				end
			else
				return "In " .. opts.workspace_name
			end
		end,

		docs = "Reading docs...",
		vcs = "Managing git...",
	},

	plugins = { { "cord.plugins.diagnostics", config = { scope = "workspace" } } },

	assets = {
		["Cargo.toml"] = {
			text = "Managing Cargo dependencies...",
		},

		["pyproject.toml"] = {
			text = "Managing Python project...",
		},
	},
})
