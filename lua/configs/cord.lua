---@alias CordDisplayer fun(opts: CordOpts): string

---@class Languages: { [string]: CordDisplayer|string }
Languages = {}

---@param language string | string[]
---@param callback CordDisplayer
function Languages:register_custom_message(language, callback)
	if type(language) == "string" then
		self[language] = callback
	else
		for _, v in ipairs(language) do
			self[v] = callback
		end
	end
end

---@return Languages
Languages.new = function()
	return setmetatable({}, Languages)
end

local lang = Languages.new()

lang:register_custom_message({ "Rust", "rust" }, function(opts)
	return "Oxidizing " .. opts.filename
end)

lang:register_custom_message({ "zig", "Zig" }, function(opts)
	return "Writing Zig at " .. opts.filename
end)

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
			local handle = lang[opts.filetype]

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
