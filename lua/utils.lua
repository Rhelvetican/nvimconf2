-- Storing functions in separate variables would access them faster. because
-- it is not required to make a key lookup in the table.
local format, rep = string.format, string.rep
local write = io.write

local M = {}

---Recursively print the table, if not table value is just printed.
---@param t any
---@param level? number
function M.printTable(t, level)
	level = level or 0

	if type(t) == "table" then
		write(rep("\t", level), "{\n")
		level = level + 1

		for key, value in pairs(t) do
			write(rep("\t", level) .. format("%s = ", key))
			M.printTable(value, level)
			write(",\n")
		end

		level = level - 1
		write(rep("\t", level), "}")
	else
		write(tostring(t))
	end

	-- print new line on the level 0
	if level == 0 then
		write("\n")
	end
end

---Recursively print the table into a file.
---@param file file* The file to dump the table to.
---@param t any
---@param level? number
function M.printTableToFile(file, t, level)
	level = level or 0

	if type(t) == "table" then
		file:write(rep("\t", level), "{\n")
		level = level + 1

		for key, value in pairs(t) do
			file:write(rep("\t", level) .. format("%s = ", key))
			M.printTableToFile(file, value, level)
			file:write(",\n")
		end

		level = level - 1
		file:write(rep("\t", level), "}")
	else
		file:write(tostring(t))
	end

	-- print new line on the level 0
	if level == 0 then
		file:write("\n")
	end
end

return M
