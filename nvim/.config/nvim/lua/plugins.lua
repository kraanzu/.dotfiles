local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup({
	function()
		-- Packer can manage itself
		use("wbthomason/packer.nvim")

		-- Performance
		-- use({
		-- 	"lewis6991/impatient.nvim",
		-- 	config = function()
		-- 		require("impatient")
		-- 	end,
		-- })
		use("nathom/filetype.nvim")
		use("dstein64/vim-startuptime")

		-- Debugguing
		use("nvim-lua/plenary.nvim")
		use("mfussenegger/nvim-dap")

		-- MAKING LIFE EASIER
		use({ "preservim/tagbar", cmd = "TagbarToggle" })
		use({
			"nvim-treesitter/nvim-treesitter",
			event = { "BufRead", "BufNewFile" },
		})
		use({ "nvim-telescope/telescope.nvim" })
		use({ "sbdchd/neoformat" })
		use({ "jreybert/vimagit", cmd = "Magit" })
		use({
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		})

		-- AUTOCOMPLETE BABY
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("user.lsp")
			end,
			event = "BufEnter",
		})
		use({ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" })
		use({
			"hrsh7th/nvim-cmp",
			after = "cmp-nvim-lsp",
			config = function()
				require("user.cmp")
			end,
		})
		use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
		use({ "hrsh7th/vim-vsnip", after = "nvim-cmp" })
		use({
			"ray-x/lsp_signature.nvim",
			config = function()
				require("lsp_signature").setup({})
			end,
		})

		-- GIT STUFF
		use("airblade/vim-gitgutter")
		use({ "tpope/vim-fugitive", cmd = "G" })

		-- HELPERS
		use("jiangmiao/auto-pairs")
		use({ "tomtom/tcomment_vim", event = "BufRead" })

		-- EYE CANDY
		use({
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup()
			end,
		})
		-- use({ "arcticicestudio/nord-vim", event = "VimEnter" })

		use("gbprod/nord.nvim")
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup({})
			end,
		})
		use({ "machakann/vim-highlightedyank", event = "BufRead" })
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("user.line")
			end,
			requires = { "kyazdani42/nvim-web-devicons" },
		})
		-- using packer.nvim
		-- use({
		-- 	"kdheepak/tabline.nvim",
		-- 	config = function()
		-- 		require("user.tabline")
		-- 	end,
		-- 	requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons"} },
		-- })

		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		})

		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				vim.opt.list = true
				vim.opt.listchars:append("eol:↴")
				require("indent_blankline").setup({
					space_char_blankline = " ",
					show_current_context = true,
				})
			end,
		})
		use({
			"onsails/lspkind.nvim",
			config = function()
				require("user.lspkind")
			end,
		})

		-- LANGAUGE STUFF
		use({ "dag/vim-fish", ft = { "fish" } })
		use({ "cespare/vim-toml", ft = { "toml" } })
		-- use({ "rust-lang/rust.vim", ft = { "rs" } })
		-- use({
		-- 	"simrat39/rust-tools.nvim",
		-- 	ft = { "rs" },
		-- 	config = function()
		-- 		require("rust-tools").setup({})
		-- 	end,
		-- })

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
})
