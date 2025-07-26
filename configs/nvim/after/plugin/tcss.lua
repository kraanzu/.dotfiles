vim.api.nvim_command("autocmd BufNewFile,BufRead *.tcss set filetype=tcss")

local client = vim.lsp.start_client({
    name = "tcss-lsp-v1",
    cmd = { "/home/kraanzu/Projects/tcss-lsp/wrapper.sh" },
    filetypes = { "tcss", "python" },
    root_dir = vim.fn.getcwd(),
    autostart = true,
})

if client then
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "tcss",
        callback = function()
            vim.lsp.buf_attach_client(0, client)
        end,
    })
else
    print("Failed to start tcss-lsp")
end
