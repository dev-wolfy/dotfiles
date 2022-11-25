local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	})
	print('Installing packer close and reopen Neovim...')
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
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end


packer.startup(function(use)

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Lua functions
	use 'nvim-lua/plenary.nvim'

	-- Notification Enhancer
	use {
		'rcarriga/nvim-notify',
		config = function() require "wolfy.plugins.notify" end,
	}

	-- Smarter Splits
	use {
		'mrjones2014/smart-splits.nvim',
		config = function() require "wolfy.plugins.smart-splits" end,
	}

	-- UI plugins
	-- Setup a dashboard when open nvim
	use {
		'glepnir/dashboard-nvim',
		config = function() require "wolfy.plugins.dashboard-nvim" end,
	}

	use 'nvim-tree/nvim-web-devicons' -- Add the support of icon in terminal
	use 'lukas-reineke/indent-blankline.nvim' -- Add thin line for every indentation
	use {
		'nvim-tree/nvim-tree.lua',
		requires = { 'nvim-tree/nvim-web-devicons' },
	} -- File explorer with support of devicons

	use {
		'norcalli/nvim-colorizer.lua',
		config = function() require "wolfy.plugins.colorizer" end,
	}
	use {
		'lewis6991/gitsigns.nvim',
		config = function() require "wolfy.plugins.gitsigns" end,
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = 'nvim-web-devicons',
		config = function() require "wolfy.plugins.lualine" end,
	}
	--[[ use {
		'nanozuki/tabby.nvim',
		config = function() require "wolfy.plugins.tabby" end,
	} ]] --

	use {
		'chentoast/marks.nvim',
		config = function() require "wolfy.plugins.marks" end,
	}
	use {
		'SmiteshP/nvim-navic',
		requires = 'neovim/nvim-lspconfig',
		config = function() require "wolfy.plugins.navic" end,
	}

	-- Themes
	--use 'EdenEast/nightfox.nvim' -- NightFox theme
	use 'dracula/vim' -- Dracula theme
	use 'joshdick/onedark.vim' -- OneDark theme (active in plugins/theme.lua)
	--use 'Mofiqul/vscode.nvim' -- VScode theme
	--use 'marko-cerovac/material.nvim' -- Material themes
	use 'folke/tokyonight.nvim' -- Tokio themes
	--use 'sainnhe/everforest' -- Green themes
	--use 'olimorris/onedarkpro.nvim' -- One dark pro themes
	--use 'rmehri01/onenord.nvim'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use('williamboman/nvim-lsp-installer') -- simple to use language server installer
	use('tamago324/nlsp-settings.nvim') -- language server settings defined in json for
	use('jose-elias-alvarez/null-ls.nvim') -- for formatters and linters
	use('elkowar/yuck.vim')

	-- cmp plugins
	use {
		'hrsh7th/nvim-cmp',
		config = function() require "wolfy.plugins.nvim-cmp" end,
	} -- The completion plugin
	use('hrsh7th/cmp-buffer') -- buffer completions
	use('hrsh7th/cmp-path') -- path completions
	use('hrsh7th/cmp-cmdline') -- cmdline completions
	use('saadparwaiz1/cmp_luasnip') -- snippet completions
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-nvim-lua')

	-- snippet
	use('rafamadriz/friendly-snippets') -- a bunch of snippets to use
	use {
		'L3MON4D3/LuaSnip',
		wants = "friendly-snippets",
	} -- snippet engine

	-- Tools plugins
	use { 'godlygeek/tabular' } -- Align content for a given char
	use 'ClementTsang/bottom' -- Htop but in nvim
	use 'windwp/nvim-autopairs' -- System of autopairs all brackets
	use 'akinsho/toggleterm.nvim'

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function() require "wolfy.plugins.treesitter" end,
	}

	use {
		"stevearc/aerial.nvim",
		config = function() require "wolfy.plugins.aerial" end,
	}

	-- Games
	use 'ThePrimeagen/vim-be-good'

	-- todo
	use {
		'nvim-telescope/telescope.nvim';
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-live-grep-args.nvim'
		},
	}
	use 'itchyny/lightline.vim'

	use {
		'akinsho/bufferline.nvim',
		tag = "v3.*",
		requires = 'nvim-tree/nvim-web-devicons',
		config = function() require "wolfy.plugins.bufferline" end,
	}

	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)

require('wolfy.plugins.nvim-cmp')
require('wolfy.plugins.autopairs')
require('wolfy.plugins.nvim-tree')
require('wolfy.plugins.theme')
require('wolfy.plugins.toggleterm')
require('wolfy.plugins.telescope')
require('wolfy.lsp.init')
