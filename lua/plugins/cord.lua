---@type {[string]: fun(opts: CordOpts): string}
local Languages = {}

---@class CordLanguage
---@field language string|string[]
---@field message fun(opts: CordOpts): string
---@overload fun(o: CordLanguage): CordLanguage
local Language = setmetatable({}, {
	---@param o CordLanguage
	---@return CordLanguage
	__call = function(_, o)
		if type(o.language) == "string" then
			Languages[o.language] = o.message
			Languages[o.language:lower()] = o.message
		else
			for _, lang in ipairs(o.language) do
				Languages[lang] = o.message
			end
		end
		return o
	end,
})

---@param s string
---@return fun(o: CordOpts): string
local function create_message(s)
	---@param o CordOpts
	return function(o)
		local diagnostics = o.diagnostics(o)

		return string.format(
			"%s %s (Line %d) %s",
			s,
			o.filename,
			o.cursor_line,
			(diagnostics > 0) and string.format("(%d %s)", diagnostics, (diagnostics < 2) and "Problem" or "Problems")
				or ""
		)
	end
end

vim.pack.add({ "https://github.com/vyfor/cord.nvim" })

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(args)
		local name, kind = args.data.spec.name, args.data.kind
		if name == "cord" and kind == "update" then
			vim.cmd.packadd(name)
		end

		vim.cmd("Cord update")
	end,
})

Language({
	language = "Rust",
	message = create_message("Oxidizing at "),
})

Language({
	language = "Zig",
	message = create_message("Being a Zigger at "),
})

Language({
	language = "Lua",
	message = create_message("Writing Lua code at "),
})

Language({
	language = { "C", "C++", "Cpp", "H", "H++", "Hpp" },
	message = create_message("Being oldschool at "),
})

Language({
	language = { "JavaScript", "TypeScript", "JS", "TS" },
	message = create_message("This is Hell, and it's at "),
})

Language({
	language = { "Python" },
	message = create_message("Writing nonsensical script at "),
})

Language({
	language = { "Typst" },
	message = create_message("Writing a paper at "),
})

require("cord").setup({
	extensions = { "diagnostics" },

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
			else
				local diagnostics = o.diagnostics(o)
				return string.format(
					"Editing %s (Line %d) (%d %s)",
					o.filename,
					o.cursor_line,
					diagnostics,
					(diagnostics < 2) and "Problem" or "Problems"
				)
			end
		end,

		workspace = function(o)
			local diagnostics = o.diagnostics(o)
			return string.format(
				"Working on %s (%d %s)",
				o.workspace,
				diagnostics,
				(diagnostics < 2) and "Problem" or "Problems"
			)
		end,
	},
})
