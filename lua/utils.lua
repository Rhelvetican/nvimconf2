---@param pat string
---@return boolean
function string:startswith(pat)
	return string.sub(self, 1, pat:len()) == pat
end

---@generic T
---@param tbl T[]
---@param item T
---@return boolean
function table.contains(tbl, item)
	for _, v in ipairs(tbl) do
		if item == v then
			return true
		end
	end

	return false
end
