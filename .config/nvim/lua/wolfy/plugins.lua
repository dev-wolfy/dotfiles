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


require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- UI plugins
	use 'glepnir/dashboard-nvim'
	use 'nvim-tree/nvim-web-devicons' -- Add the support of icon in terminal
	use {
		'nvim-tree/nvim-tree.lua'; -- File explorer
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}
	-- Themes
	use 'EdenEast/nightfox.nvim' -- NightFox theme
	use 'dracula/vim'            -- Dracula theme
	use 'joshdick/onedark.vim'   -- OneDark theme

	-- Tools plugins
	use 'godlygeek/tabular'
	use 'ClementTsang/bottom'

	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'itchyny/lightline.vim'
	

	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)

--require('wolfy.plugins.alpha')
require('wolfy.plugins.dashboard-nvim')
require('wolfy.plugins.nvim-tree')
require('wolfy.plugins.theme')
