set number

syntax enable

set encoding=utf8

filetype plugin on
syntax on
colorscheme mustang

set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""

" :PlugInstall -> Installation des plugins
" :PlugUpdate  -> Mise à jour des plugins
" :PlugClean   -> Supprime un plugin

if !1 | finish | endif

" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    echo "Installing VimPlug..."
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin()

Plug 'godlygeek/tabular'
Plug 'ycm-core/youcompleteme'
Plug 'rust-lang/rust.vim'
Plug 'itchyny/lightline.vim'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""
" => You Complete Me
"""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_server_log_level = 'debug'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_use_vim_stdout = 0


let ext = expand('%:e')
set statusline=\ %{HasPast()}%F%m%r%h\ %w\ \ PWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c\ \ Ext:\ %{expand('%:e')}


function! HasPast()
	if &paste
		return 'PASTE MODE '
	endif
	return ''
endfunction
