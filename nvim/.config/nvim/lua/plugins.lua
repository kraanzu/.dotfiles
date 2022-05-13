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
		use({ "wbthomason/packer.nvim" })

		use("nvim-lua/plenary.nvim")
		use("mfussenegger/nvim-dap")

		-- MAKING LIFE EASIER
		use({
			"nvim-treesitter/nvim-treesitter",
			event = { "BufRead", "BufNewFile" },
		})
		use({ "nvim-treesitter/playground", event = "BufRead" })
		use({ "nvim-telescope/telescope.nvim", cmd = "Telescope" })
		use({ "sbdchd/neoformat", event = "BufRead" })
		use({ "tpope/vim-surround", event = "BufRead" })
		use({ "jreybert/vimagit", event = "BufRead" })

		use("hrsh7th/cmp-nvim-lsp")
		use({ "hrsh7th/cmp-buffer", event = "BufRead" })
		use({ "hrsh7th/cmp-path" })
		use({
			"ray-x/lsp_signature.nvim",
			after = "nvim-lspconfig",
			config = function()
				require("lsp_signature").setup()
			end,
		})

		-- AUTOCOMPLETE BABY
		use("neovim/nvim-lspconfig")
		use("hrsh7th/nvim-cmp")
		use({ "williamboman/nvim-lsp-installer", cmd = "LspInstall" })
		use({ "hrsh7th/vim-vsnip", event = "BufRead" })

		-- GIT STUFF
		use("airblade/vim-gitgutter")
		use({ "tpope/vim-fugitive", cmd = "G" })

		-- MISCS
		use("jiangmiao/auto-pairs")
		use({ "tomtom/tcomment_vim", event = "BufRead" })

		-- EYE CANDY
		use("arcticicestudio/nord-vim")
		use({ "machakann/vim-highlightedyank", event = "BufRead" })
		use("vim-airline/vim-airline")
		use("vim-airline/vim-airline-themes")
		use("folke/todo-comments.nvim")

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
