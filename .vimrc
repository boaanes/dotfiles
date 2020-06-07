let mapleader=' '

call plug#begin()
    Plug 'dylanaraps/wal.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-gitgutter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'yuezk/vim-js'
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'alvan/vim-closetag'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
    Plug 'ap/vim-css-color'
    Plug 'elmcast/elm-vim'

call plug#end()

" BINDINGS
    noremap q <Nop>
    noremap <S-q> <Nop>
    noremap <leader>t :NERDTreeToggle<CR>
    noremap <leader>w :w<CR>
    noremap <leader>f :Files<CR> 
"    noremap <leader>e :ALEDetail<CR>
    noremap <leader>q :q<CR>
    noremap fq :q!<CR>
    noremap <leader>b :TerminalVSplit bash<CR>
    noremap <Tab> :tabn<CR>
    noremap <S-Tab> :tabp<CR> 
    noremap <leader>n :new<CR>:tab split<CR>:tabp<CR>:q<CR>:tabn<CR>
    
" AUTOCLOSE BRACKETS
"    inoremap {<CR> {<CR><CR>}<up><Tab>

" SHORTCUTS
    autocmd FileType java inoremap sout System.out.println();<left><left>

" AUTOCOMPLETE
    set hidden
    set updatetime=300
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

" AIRLINE
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1

" EXECUTION 
    autocmd FileType haskell noremap <leader>+  :!clear && ghci %<CR>
    autocmd FileType java noremap <leader>+ :!clear && javac % && java %:r && rm *.class<CR>
    autocmd FileType python noremap <leader>+ :!clear && python %<CR>

" SETTINGS
    syntax on
    filetype plugin indent on
    
    set encoding=UTF-8

    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set number relativenumber
    set wildmode=longest,list,full
    set splitbelow splitright
    set formatoptions-=r16
    set autoindent
    set nowrap
    set scrolloff=10
    set clipboard=unnamedplus

    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
    autocmd FileType jsx set omnifunc=htmlcomplete#CompleteTags

    set noshowmode

    " remove delay
    set timeoutlen=1000 ttimeoutlen=0

    let g:vim_jsx_pretty_highlight_close_tag = 1
    let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

    let g:livepreview_previewer = 'zathura'

    colorscheme wal
