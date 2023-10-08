source ~/.vimrc.keymap
set nocompatible
set ignorecase
set hlsearch
set number
set showmatch
syntax on
set tabstop=4

set statusline=%F
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=%=
set statusline+=[ENC=%{&fileencoding}]
set laststatus=2

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

"snippets
Plugin 'honza/vim-snippets'

"some utils
Plugin 'mbbill/undotree'
Plugin 'osyo-manga/vim-over'
Plugin 'preservim/nerdtree'

"settings for cherry blossom theme
Plugin 'float168/vim-colors-cherryblossom'

"settings for vim vundle 
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'

"settings gor vim plug
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"settings for python language server
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/async.vim'
"Plugin 'ryanolsonx/vim-lsp-python'
Plugin 'prabirshrestha/asyncomplete.vim'

"settings for python
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'davidhalter/jedi-vim'

"settings for golang
Plugin 'mattn/vim-lsp-settings'
Plugin 'mattn/vim-goimports'

call vundle#end()
filetype plugin indent on

let g:lsp_log_verbose=1
let g:lsp_log_file=expand('~/.cache/tmp/vim-lsp.log')
let g:lsp_log_diagnostics_echo_cursor=1
let g:asyncomplete_auto_popup=1

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
	    \ 'workspace_config' : {
        \   'pyls' : {
        \     'plugins' : {
        \        'ignore' : [
	    \           "E501"
	    \        ]}}}
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
endfunction

augroup lsp_install
     au!
     autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
augroup LspAutoFormatting
		autocmd!
		autocmd BufWritePre *.py LspDocumentFormatSync
augroup END

set background=dark

"try
"    colorscheme cherryblossom
"endtry

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go LspDocumentFormatSync
endif
