set nocompatible

filetype off     " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Interface
    Plugin 'git://github.com/flazz/vim-colorschemes.git'
    Plugin 'git://github.com/kien/ctrlp.vim.git'
    Plugin 'git://github.com/scrooloose/nerdtree.git'
    Plugin 'git://github.com/vim-scripts/UltiSnips.git'
    Plugin 'git://github.com/ervandew/supertab.git'
    Plugin 'git://github.com/scrooloose/nerdcommenter.git'
    Plugin 'git://github.com/tpope/vim-fugitive.git'
    Plugin 'git://github.com/scrooloose/syntastic.git'
    Plugin 'git://github.com/fatih/vim-go.git'

call vundle#end()            " required

filetype plugin indent on     " required!

" Interface
    set autochdir
    set shell=/usr/bin/zsh\ -l
    set number
    set encoding=utf-8
    set fileencodings=utf-8,cp1251
    set fileformat=unix
    set title
    set showcmd
    set scrolloff=999
    set colorcolumn=80
    set autoindent
    set smartindent
    set shiftwidth=4
    set expandtab
    set tabstop=4
    set softtabstop=4
    set linespace=1
    set cursorline
    set guicursor=n:blinkon0
    set guioptions=
    set t_Co=256
    set splitbelow
    set splitright
    set shortmess+=I
    set mousehide
    set hidden
    set laststatus=2
    set statusline=\ 
    set statusline+=%n:\ 
    set statusline+=%t
    set statusline+=%m
    set statusline+=\ \ 
    set statusline+=%{&paste?'[paste]\ ':''}
    set statusline+=%{&fileencoding}
    set statusline+=\ \ %Y
    set statusline+=\ %3.3(%c%)
    set statusline+=\ \ %3.9(%l/%L%)

    let mapleader = ","

        nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

        vnoremap < <gv
        vnoremap > >gv

        set pastetoggle=<Leader>p

        nnoremap <leader>s :<C-u>%s//<left>
        vnoremap <leader>s :s//<left>

        inoremap {<CR> {<CR>}<Esc>O
        inoremap (<CR> (<CR>)<Esc>O
        inoremap [<CR> [<CR>]<Esc>O

        inoremap <Up> <NOP>
        inoremap <Down> <NOP>
        inoremap <Left> <NOP>
        inoremap <Right> <NOP>
        noremap <Up> <NOP>
        noremap <Down> <NOP>
        noremap <Left> <NOP>
        noremap <Right> <NOP>
        " Navigate with <Ctrl>-hjkl in Insert mode
        inoremap <C-h> <C-o>h
        inoremap <C-j> <C-o>j
        inoremap <C-k> <C-o>k
        inoremap <C-l> <C-o>l

        cnoremap <c-e> <end>
        inoremap     <c-e> <c-o>$
        cnoremap <c-a> <home>
        inoremap     <c-a> <c-o>^

        nnoremap <C-h> <C-W>h
        nnoremap <C-j> <C-W>j
        nnoremap <C-k> <C-W>k
        nnoremap <C-l> <C-W>l

        nnoremap <Space> <PageDown>

        nnoremap n nzz
        nnoremap N Nzz
        nnoremap * *zz
        nnoremap # #zz
        nnoremap g* g*zz
        nnoremap g# g#zz

        nnoremap gf :<C-u>vertical wincmd f<CR>
        vnoremap <silent> <Leader>c :s/\v\C(([a-z]+)([A-Z]))/\2_\l\3/g<CR>
        nnoremap <leader>ts :<C-u>%s/\s\+$//e<CR>
        nnoremap <Leader>bl :<C-u>ls<cr>:b
        nnoremap <Leader>bp :<C-u>bp<cr>
        nnoremap <Leader>bn :<C-u>bn<cr>
        nnoremap <Leader>u gUiw
        inoremap <Leader>u <esc>gUiwea

    " Switch tabs with <Tab>
        nnoremap <Tab> gt
        nnoremap <S-Tab> gT

" Environment
    " Store lots of history entries: :cmdline and search patterns
    set history=1000
    " Save file with root permissions
    command! W exec 'w !sudo tee % > /dev/null' | e!

        set backspace=indent,eol,start
        set nobackup
        set noswapfile

        set viminfo='10,\"100,:20,%,n~/.viminfo
        au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Plugins
	syntax enable
    set background=dark
    try
        colorscheme base
    catch /^Vim\%((\a\+)\)\=:E185/
        echo "colorscheme is not found. Run :PluginInstall"
    endtry

    " NERDTree
        nnoremap <F7> :<C-u>NERDTreeToggle<CR>
        let NERDTreeShowBookmarks=1
        let NERDTreeChDirMode=2
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=0
        let NERDTreeMinimalUI=1
        let NERDTreeDirArrows=1
        let NERDTreeBookmarksFile= $HOME . '/.vim/.NERDTreeBookmarks'

    " UltiSnips
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
