vim.pack.add({ "https://www.github.com/folke/tokyonight.nvim" })

local TokyonightUtils = {}

---@alias OverrideMethod "override" | "extend"

---@class Override
---@field method OverrideMethod
---@field override tokyonight.Highlight

---@param lookup tokyonight.Highlights
---@param item (tokyonight.Highlight|string)
---@return tokyonight.Highlight
function TokyonightUtils.coerceHl(lookup, item)
	if type(item) == "string" then
		if lookup[item] == nil then
			return { fg = item }
		else
			return TokyonightUtils.coerceHl(lookup, lookup[item])
		end
	else
		return item
	end
end

---@param hls tokyonight.Highlights
---@param proc table<string, Override>
function TokyonightUtils.processHl(hls, proc)
	for hl, item in pairs(proc) do
		if item.method == "extend" then
			hls[hl] = vim.tbl_deep_extend("force", TokyonightUtils.coerceHl(hls, hls[hl]), item.override)
		else
			hls[hl] = item.override
		end
	end
end

require("tokyonight").setup({
	day_brightness = 0.4,
	dim_inactive = true,

	light_style = "day",
	transparent = false,
	terminal_colors = true,

	style = "moon",

	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		variables = { italic = true },
		sidebars = "dark",
		floats = "dark",
	},

	cache = true,

	lualine_bold = true,

	on_colors = function(_) end,

	on_highlights = function(highlights, colors)
		TokyonightUtils.processHl(highlights, {
			Special = { method = "override", override = { fg = colors.blue5 } },
			String = { method = "extend", override = { bold = true } },
			Identifier = { method = "extend", override = { italic = true, bold = true } },
			Function = { method = "extend", override = { italic = true, bold = true } },

			["@punctuation.bracket"] = { method = "override", override = { fg = colors.blue5 } },
			["@keyword"] = { method = "extend", override = { bold = true } },

			["@variable"] = { method = "extend", override = { italic = true, bold = true } },
			["@variable.builtin"] = { method = "extend", override = { italic = true, bold = true } },
			["@variable.member"] = { method = "extend", override = { italic = true, bold = true } },
			["@variable.parameter"] = { method = "extend", override = { italic = true, bold = true } },
		})
	end,

	plugins = { all = true },
})
