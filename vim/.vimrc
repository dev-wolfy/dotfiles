"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Jean-Baptiste Louze
"
"           https://github.com/amix/vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" https://devhints.io/vim
" https://devhints.io/vim-digraphs
" https://devhints.io/vimscript
" https://github.com/preservim/nerdtree
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set number

autocmd vimenter * NERDTree

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Showing line number
set number

" Set utf8 as standard encoding
set encoding=utf8

" Try to set colorscheme desert
"try
"    colorscheme desert
"catch
"endtry


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
let ext = expand('%:e')
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ PWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c\ \ Ext:\ %{expand('%:e')} 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :PlugInstall -> Installation des plugins
" :PlugUpdate  -> Mise à jour des plugins
" :PlugClean   -> Supprime un plugins

call plug#begin()

" VIM-easy-align : https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" VIM-tabular : https://devhints.io/tabular
Plug 'godlygeek/tabular'
" VIM-NERDTree : https://github.com/preservim/nerdtree
Plug 'preservim/NERDTree'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


"function! YamlTab()
"    let extention = expand('%:e')
"    if (extention == 'yaml') || (extention == 'YAML')
"        return 1
"    elseif
"        return 0
"    endif
"endfunction



"if YamlTab()
"  set expandtab
"  set tabstop=2
"endif
