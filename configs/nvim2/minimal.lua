-- vim.opt.runtimepath = vim.env.VIMRUNTIME
vim.cmd.colorscheme('nord')

if vim.fn.isdirectory('.git') == 0 then
    print('Not a git repository')
    vim.cmd('qa!')
    return
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "NeogitStatus",
    callback = function(ev)
        vim.api.nvim_create_autocmd("BufWinLeave", {
            buffer = ev.buf,
            callback = function()
                vim.schedule(function()
                    if #vim.api.nvim_list_wins() == 1 or #vim.fn.getbufinfo({ buflisted = 1 }) == 0 then
                        vim.cmd("qa")
                    end
                end)
            end,
        })
    end,
})

local neogit = require('neogit')
neogit.setup({
    disable_hint = true,
})

neogit.open()
vim.schedule(function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_get_name(buf) == "" and vim.bo[buf].buftype == "" then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
end)
