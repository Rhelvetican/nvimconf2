local createUserCmd = vim.api.nvim_create_user_command

createUserCmd("PackUpdate", function(args)
	local plugins = args.fargs

	if #plugins == 0 then
		vim.pack.update()
	else
		vim.pack.update(plugins)
	end
end, {})

createUserCmd("PackList", function(args)
	local plugins = args.fargs

	if #plugins == 0 then
		vim.pack.update()
	else
		vim.pack.update(plugins)
	end
end, {})

createUserCmd("OpenConfig", function(_)
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, {})

createUserCmd("LspInfo", function(_)
	vim.cmd("checkhealth vim.lsp")
end, {})
