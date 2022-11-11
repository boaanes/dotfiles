let mapleader=' '

call plug#begin()
    " theming
    Plug 'dylanaraps/wal.vim'

    " navigation
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

    " efficiency
    Plug 'tpope/vim-surround'
    Plug 'alvan/vim-closetag'

    " git
    Plug 'airblade/vim-gitgutter'

    " langauge server
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
    Plug 'vim-autoformat/vim-autoformat'

    " syntax highlighting
    Plug 'yuezk/vim-js'
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'neovimhaskell/haskell-vim'

    " appearance
    Plug 'vim-airline/vim-airline'
    Plug 'ap/vim-css-color'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

" BINDINGS
    noremap q <Nop>
    noremap <S-q> <Nop>
    noremap <leader>t :NERDTreeToggle<CR>
    noremap <leader>w :w<CR>
    noremap <leader>p :Files<CR> 
    noremap <leader>q :q<CR>
    noremap fq :q!<CR>
    noremap <Tab> :bn<CR>
    noremap <S-Tab> :bp<CR> 
    noremap <leader>d :bd<CR>
    noremap <leader>n :ene<CR>
    
" AIRLINE
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1

" COC
    set nobackup
    set nowritebackup
    set updatetime=300
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice.
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

" FORMATTING
    autocmd BufWrite *.hs :Autoformat
    autocmd FileType haskell let b:autoformat_autoindent=0

" EXECUTION 
    autocmd FileType haskell noremap <leader>+  :!clear && ghci %<CR>
    autocmd FileType java noremap <leader>+ :!clear && javac % && java %:r && rm *.class<CR>
    autocmd FileType python noremap <leader>+ :!clear && python %<CR>
    autocmd FileType c noremap <leader>+ :!clear && gcc -o %:r % && ./%:r<CR>

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
    let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'
    " doesnt work?
    let g:closetag_regions = {
        \ 'typescript.tsx': 'jsxRegion,tsxRegion',
        \ 'javascript.jsx': 'jsxRegion',
        \ 'typescriptreact': 'jsxRegion,tsxRegion',
        \ 'javascriptreact': 'jsxRegion',
        \ }

    let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
    let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
    let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
    let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
    let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
    let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
    let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

    let g:livepreview_previewer = 'zathura'

    colorscheme sonokai
