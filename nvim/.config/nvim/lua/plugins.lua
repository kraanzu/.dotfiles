-- SELF INSTALL
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
	function()
		-- Packer can manage itself
		use("wbthomason/packer.nvim")

		use("nvim-lua/plenary.nvim")
		use("mfussenegger/nvim-dap")

		-- MAKING LIFE EASIER
		use("nvim-treesitter/nvim-treesitter")
		use("nvim-treesitter/playground")
		use("nvim-telescope/telescope.nvim")
		use({ "sbdchd/neoformat", opt = true, event = "BufRead" })
		use({ "tpope/vim-surround", opt = true, event = "BufRead" })
		use({ "jreybert/vimagit", opt = true, event = "BufRead" })

		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")

		-- AUTOCOMPLETE BABY
		use("neovim/nvim-lspconfig")
		use("williamboman/nvim-lsp-installer")
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/vim-vsnip")

		-- GIT STUFF
		use("airblade/vim-gitgutter")
		use("tpope/vim-fugitive")

		-- MISCS
		use("jiangmiao/auto-pairs")
		use("tomtom/tcomment_vim")

		-- EYE CANDY
		use("arcticicestudio/nord-vim")
		use("machakann/vim-highlightedyank")
		use("vim-airline/vim-airline")
		use("vim-airline/vim-airline-themes")
		use("folke/todo-comments.nvim")

		-- LANGAUGE STUFF
		use("rust-lang/rust.vim")
		use("simrat39/rust-tools.nvim")
		use("dag/vim-fish")
		use("cespare/vim-toml")

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
