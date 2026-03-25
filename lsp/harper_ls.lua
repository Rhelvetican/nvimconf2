return {
	filetypes = { "typst" },
	settings = {
		["harper-ls"] = {
			linters = {
				NoFrenchSpaces = false,
				Spaces = false,
			},
			codeActions = {},
			markdown = {},
			diagnosticSeverity = "hint",
			dialect = "American",
			maxFileLength = 160000,
		},
	},
}
