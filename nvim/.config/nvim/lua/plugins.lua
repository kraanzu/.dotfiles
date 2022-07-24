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
		use({
			"lewis6991/impatient.nvim",
			config = function()
				require("impatient")
			end,
		})
		use("godlygeek/tabular")
		use({ "wbthomason/packer.nvim" })
		-- Lua
		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
			end,
		})
		use("nathom/filetype.nvim")
		use("dstein64/vim-startuptime")

		use("nvim-lua/plenary.nvim")
		use("mfussenegger/nvim-dap")

		-- MAKING LIFE EASIER
		use({ "preservim/tagbar", cmd = "TagbarToggle" })
		use({
			"pseewald/vim-anyfold",
			event = { "BufRead", "BufNewFile" },
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			event = { "BufRead", "BufNewFile" },
		})
		use({ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" })

		use({ "nvim-telescope/telescope.nvim", cmd = "Telescope" })
		use({ "tpope/vim-surround", event = "BufRead" })
		use({ "sbdchd/neoformat", cmd = "Neoformat" })
		use({ "jreybert/vimagit", cmd = "Magit" })

		-- AUTOCOMPLETE BABY
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("user.lsp")
			end,
		})
		-- use({ "williamboman/nvim-lsp-installer", cmd = "LspInstall" })
		-- use({
		-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		-- 	config = function()
		-- 		require("lsp_lines").setup()
		-- 		-- Disable virtual_text since it's redundant due to lsp_lines.
		-- 		vim.diagnostic.config({
		-- 			virtual_text = false,
		-- 		})
		-- 	end,
		-- })
		use({
			"hrsh7th/nvim-cmp",
			after = "cmp-nvim-lsp",
			config = function()
				require("user.cmp")
			end,
		})
		use({ "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" })
		use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
		use({ "hrsh7th/vim-vsnip", after = "nvim-cmp" })

		-- GIT STUFF
		use("airblade/vim-gitgutter")
		use({ "tpope/vim-fugitive", cmd = "G" })

		-- MISCS
		use("jiangmiao/auto-pairs")
		use({ "tomtom/tcomment_vim", event = "BufRead" })

		-- EYE CANDY
		-- use ({'sunjon/shade.nvim'})
		use({ "arcticicestudio/nord-vim", event = "VimEnter" })
		use({ "machakann/vim-highlightedyank", event = "BufRead" })
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("lualine").setup()
			end,
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})
		use({
			"kdheepak/tabline.nvim",
			config = function()
				require("tabline").setup({})
			end,
			requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
		})

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

		-- LANGAUGE STUFF
		use({ "rust-lang/rust.vim", ft = { "rs" } })
		use({
			"simrat39/rust-tools.nvim",
			ft = { "rs" },
			config = function()
				require("rust-tools").setup({})
			end,
		})

		use({ "dag/vim-fish", ft = { "fish" } })

		use({ "cespare/vim-toml", ft = { "toml" } })

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
})
