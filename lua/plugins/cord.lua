return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	config = function()
		---@type {[string]: fun(opts: CordOpts): string}
		local Languages = {}

		---@class Language
		---@field language string|string[]
		---@field message fun(opts: CordOpts): string
		---@overload fun(o: Language): Language
		local Language = setmetatable({}, {
			---@param o Language
			---@return Language
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
		---@return fun()
		local function create_message(s)
			---@param o CordOpts
			return function(o)
				local diagnostics = o.diagnostics(o)

				return string.format(
					"%s %s (Line %d) %s",
					s,
					o.filename,
					o.cursor_line,
					(diagnostics > 0)
							and string.format("(%d %s)", diagnostics, (diagnostics < 2) and "problem" or "problems")
						or ""
				)
			end
		end

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
			message = create_message("Writing very cool Lua code at "),
		})

		Language({
			language = { "C", "C++", "Cpp", "H", "H++", "Hpp" },
			message = create_message("Being oldschool at "),
		})

		Language({
			language = { "JavaScript", "TypeScript" },
			message = create_message("This is Hell, and it's at "),
		})

		Language({
			language = { "Python" },
			message = create_message("Writing nonsensical script at "),
		})

		require("cord").setup({
			plugins = {
				"cord.plugins.diagnostics",
			},

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

					return "Editing " .. o.filename .. "(Line" .. o.cursor_line .. ")"
				end,

				workspace = function(o)
					return "Working on " .. o.workspace
				end,
			},
		})
	end,
}
