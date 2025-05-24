vim.api.nvim_command("autocmd BufNewFile,BufRead *.tcss set filetype=tcss")

local client = vim.lsp.start_client({
	name = "tcss-lsp-v1",
	cmd = { "/home/kraanzu/Projects/tcss-lsp/tcss-lsp" },
	filetypes = { "tcss" },
	root_dir = vim.fn.getcwd(),
	autostart = true,
})

if client then
	print("tcss-lsp started successfully")
    -- Manually call the function to start the LSP
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "tcss",
        callback = function()
            vim.lsp.buf_attach_client(0, client)
        end,
    })
else
	print("Failed to start tcss-lsp")
end

