local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
return require("lazy").setup({
	-- ESSENTIALS
	"nvim-lua/plenary.nvim",
	"mfussenegger/nvim-dap",
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
		cmd = "Mason",
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("user.lsp")
		end,
		event = "BufRead",
	},
	{ "hrsh7th/cmp-nvim-lsp", event = "BufRead" },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("user.cmp")
		end,
	},
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/vim-vsnip",
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup({})
		end,
		event = "BufWrite",
	},

	-- USEFUL STUFF
	{ "preservim/tagbar", cmd = "TagbarToggle" },
	{ "nvim-telescope/telescope.nvim", cmd = "Telescope", tag = "0.1.2" },
	{ "sbdchd/neoformat", event = "BufRead" },
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		config = function()
			require("neogit").setup()
		end,
	},

	-- HELPERS
	{ "jiangmiao/auto-pairs" },
	{ "tomtom/tcomment_vim", event = "BufRead" },

	-- GIT STUFF
	"airblade/vim-gitgutter",
	{ "tpope/vim-fugitive", cmd = "G" },

	-- EYE CANDY
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
		event = "BufRead",
	},

	"gbprod/nord.nvim",
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
		config = function()
			require("user.line")
		end,
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},

	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append("eol:↴")
			require("indent_blankline").setup({
				space_char_blankline = " ",
				show_current_context = true,
			})
		end,
	},
	{
		"onsails/lspkind.nvim",
		config = function()
			require("user.lspkind")
		end,
	},

	-- LANGAUGE SPECIFIC
	{ "dag/vim-fish", ft = { "fish" } },
	{ "cespare/vim-toml", ft = { "toml" } },
	{ "rust-lang/rust.vim", ft = { "rs" } },
	{
		"simrat39/rust-tools.nvim",
		ft = { "rs" },
		config = function()
			require("rust-tools").setup({})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = { "md" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
})