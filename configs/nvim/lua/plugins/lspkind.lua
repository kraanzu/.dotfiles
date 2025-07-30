return {
    {
        "onsails/lspkind.nvim",
        event = "BufRead",
        config = function()
            require("lspkind").init({})
        end,
    },
}
