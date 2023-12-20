return {
	-- EYE CANDY
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
		event = "BufRead",
	},
    {"gbprod/nord.nvim",
        config = function()
          vim.cmd.colorscheme "nord"
        end,
    },
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
		event = "BufRead",
	},
	{ "machakann/vim-highlightedyank", event = "BufRead" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("plugin.line")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		tag = "v2.20.8",
        		config = function()
			require("plugin.indent_blankline")
		end,
	},
	{
		"onsails/lspkind.nvim",
        		config = function()
			require("plugin.lspkind")
		end,
	},
}
