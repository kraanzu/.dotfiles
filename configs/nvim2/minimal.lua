-- Minimal lua config to be used inside zed

local lazypath = vim.fn.stdpath("data") .. "/lazy"

if vim.fn.isdirectory('.git') == 0 then
    print('Not a git repository')
    vim.cmd('qa!')
    return
end

vim.opt.runtimepath:append(lazypath .. "/plenary.nvim")
vim.opt.runtimepath:append(lazypath .. "/neogit")
vim.opt.runtimepath:append(lazypath .. "/nord.nvim")

require('nord').setup()
vim.cmd.colorscheme('nord')

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
neogit.setup()
neogit.open()
