local client = vim.lsp.start_client({
	name = "tcss-lsp",
	cmd = { "/home/kraanzu/Projects/tcss-lsp/tcss-lsp" },
})

if not client then
	print("Failed to start tcss-lsp")
end
