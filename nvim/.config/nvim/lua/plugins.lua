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

		use("dstein64/vim-startuptime")
		use({ "wbthomason/packer.nvim" })

		use("nvim-lua/plenary.nvim")
		-- use("mfussenegger/nvim-dap")

		-- MAKING LIFE EASIER
		use({
			"nvim-treesitter/nvim-treesitter",
			event = { "BufRead", "BufNewFile" },
		})
		-- use({ "nvim-treesitter/playground", event = "BufRead" })
		use({ "nvim-telescope/telescope.nvim", cmd = "Telescope" })
		use({ "sbdchd/neoformat", event = "BufRead" })
		-- use({ "tpope/vim-surround", event = "BufRead" })
		use({ "jreybert/vimagit", cmd = "Magit" })

		-- AUTOCOMPLETE BABY
		use("neovim/nvim-lspconfig")
		use({ "williamboman/nvim-lsp-installer", cmd = "LspInstall" })

		use({
			"hrsh7th/nvim-cmp",
			after = "cmp-nvim-lsp",
			config = function()
				local cmp = require("cmp")

				cmp.setup({
					snippet = {
						expand = function(args)
							vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						end,
					},
					mapping = cmp.mapping.preset.insert({
						["<C-b>"] = cmp.mapping.scroll_docs(-4),
						["<C-f>"] = cmp.mapping.scroll_docs(4),
						["<C-Space>"] = cmp.mapping.complete(),
						["<C-e>"] = cmp.mapping.abort(),
						["<CR>"] = cmp.mapping.confirm({ select = true }),
					}),
					sources = cmp.config.sources({
						{ name = "nvim_lsp" },
						{ name = "vsnip" }, -- For vsnip users.
					}, {
						{ name = "buffer" },
					}),
				})

				cmp.setup.filetype("gitcommit", {
					sources = cmp.config.sources({
						{ name = "cmp_git" },
					}, {
						{ name = "buffer" },
					}),
				})

				cmp.setup.cmdline("/", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = {
						{ name = "buffer" },
					},
				})

				cmp.setup.cmdline(":", {
					mapping = cmp.mapping.preset.cmdline(),
					sources = cmp.config.sources({
						{ name = "path" },
					}, {
						{ name = "cmdline" },
					}),
				})

				-- Setup lspconfig.
				local capabilities = require("cmp_nvim_lsp").update_capabilities(
					vim.lsp.protocol.make_client_capabilities()
				)
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
		use("arcticicestudio/nord-vim")
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
				require("tabline").setup({
					options = {
						section_separators = { "", "" },
						component_separators = { "", "" },
						modified_italic = true, -- set to true by default; this determines whether the filename turns italic if modified
					},
				})
			end,
			requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
		})

		-- using packer.nvim
		-- use({
		-- 	"akinsho/bufferline.nvim",
		-- 	tag = "v2.*",
		-- 	requires = "kyazdani42/nvim-web-devicons",
		-- 	config = function()
		-- 		vim.opt.termguicolors = true
		-- 		require("bufferline").setup({})
		-- 	end,
		-- })
		-- use("vim-airline/vim-airline")
		-- use("vim-airline/vim-airline-themes")
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
