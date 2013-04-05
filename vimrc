"
" Custom vimrc
"
" No janus or spf13 so this the only requirements are:
"
" o brew install macvim
"
"   NOTE: This configuration should work on linux
"         w/gvim but is untested.
"
" o this file at ~/.vimrc
"
" o ~/.vim directory
"

set nocompatible

"
" Vundle
"
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage vundle
" required!
Bundle 'gmarik/vundle'

" Bundles
Bundle "wgibbs/vim-irblack"
Bundle "nanotech/jellybeans.vim"
Bundle "tomasr/molokai"
Bundle "altercation/vim-colors-solarized"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-endwise"
Bundle "mileszs/ack.vim"
Bundle "kien/ctrlp.vim"
Bundle "ZoomWin"
Bundle "Lokaltog/vim-powerline"
Bundle "kana/vim-textobj-user"
Bundle "nelstrom/vim-textobj-rubyblock"
Bundle "benmills/vimux"
Bundle "tComment"
Bundle "pangloss/vim-javascript"
Bundle "jiangmiao/auto-pairs"
Bundle "Shougo/neocomplcache"
Bundle "kchmck/vim-coffee-script"
Bundle "majutsushi/tagbar"
Bundle "nono/vim-handlebars"
Bundle 'airblade/vim-gitgutter'

filetype plugin indent on
syntax enable
runtime macros/matchit.vim

" Color Scheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Misc
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.
set title                         " Set the terminal's title
set visualbell                    " No beeping.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
" set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set directory+=,~/tmp,$TMP
set autowrite                     " write the file when switching buffers
" prevent esc delays (http://ksjoberg.com/vim-esckeys.html)
set noesckeys

let mapleader = ","               " use comma (,) for leader

" Highlighting
au BufNewFile,BufRead *.ejs set filetype=html

" don't use ESC so much
inoremap jk <esc>

" Syntax Highlighting
au BufNewFile,BufRead *.hbars set ft=handlebars
au BufNewFile,BufRead *.hbs.erb set ft=handlebars
au BufNewFile,BufRead *.ejs set ft=handlebars""
au BufRead,BufNewFile *.rabl setf ruby

" Ctrl-P Tweaks
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.hg$\|\.svn$\|log$\|coverage\/rcov\|tmp$',
	\ 'file': '\.log$'
	\ }
let g:ctrlp_jump_to_buffer = 0

" Listchars
set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
" The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen
set listchars+=extends:>
" The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen
set listchars+=precedes:<

" Tabs
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

" Status
set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Font (from spf13vim)
if has('gui_running')
  set guioptions-=T           " remove the toolbar
  "set lines=40                " 40 lines of text instead of 24,
  "if has("gui_gtk2")
  "  set guifont=Andale\ Mono\ Regular\ 13,Menlo\ Regular\ 13,Consolas\ Regular\ 13,Courier\ New\ Regular\ 13
  "else
  "  set guifont=Andale\ Mono\ Regular:h13,Menlo\ Regular:h13,Consolas\ Regular:h13,Courier\ New\ Regular:h13
  "endif
  if has('gui_macvim')
    set transparency=3          " Make the window slightly transparent
	set guifont=Monaco:h13
  endif
else
  if &term == 'xterm' || &term == 'screen'
    set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
  endif
  "set term=builtin_ansi       " Make arrow and other keys work
endif

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
" autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Adjust viewports to the same size
map <Leader>= <C-w>=

" better window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" improve buffer switching
nmap <leader>F :CtrlPMRU<CR>
nmap <leader>b :CtrlPBuffer<CR>

" navigate tags
nmap <leader>t :CtrlPBufTag<CR>

" fugitive mappings
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
" close the Gdiff split
nmap  <leader>gD :Gedit<CR><C-w>h :q<CR><C-w>k
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gr :Gread<CR>

" Ack
map <leader>f :Ack<space>

" Tagbar
nmap <leader>T :TagbarToggle<CR>
nmap <leader>To :TagbarOpen j<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" Rails.vim
" :Rpmodel and punit items
" TODO:  This works but the best way would just be to append to
" each respective path (persistence and unit)
autocmd User Rails Rnavcommand pmodel    app/models/persistence
autocmd User Rails Rnavcommand punit     test/unit   -suffix=_test.rb

" Custom Functions

" clean up whitespace
" http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

function! ReformatDocument()
  execute ':call Preserve("%s/\\s\\+$//e")'
  execute ':call Preserve("normal gg=G")'
  execute ':w'
  execute ':bn'
endfunction
nmap <leader>fed :call ReformatDocument()<CR>

function! FixMixedDosEncoding()
  execute ':e ++ff=dos'
  execute ':setlocal ff=unix'
  execute ':w'
endfunction
nmap <leader>fee :call FixMixedDosEncoding()<CR>

" Neocompletecache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" end neocompletecache
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
" https://github.com/r00k/dotfiles/blob/master/vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  " TODO:  Abstract test runner and allow it to be set to turn
  call SetTestRunner("!ruby -Itest")
  
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec g:bjo_test_runner g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! RunMatchingTest(pattern)
  call SetTestFile()
  " TODO:  Abstract test runner and allow it to be set to turn
  call SetTestRunner("!turn -Itest")

  exec g:bjo_test_runner g:bjo_test_file . " -n/" . a:pattern . "/"
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

function! CorrectTestRunner()
  if match(expand('%'), '\.feature$') != -1
    return "cucumber"
  elseif match(expand('%'), '_spec\.rb$') != -1
    return "rspec"
  else
    return "ruby"
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
