" Load Pathogen
call pathogen#runtime_append_all_bundles()

" Don't need vi compatability mode
set nocompatible

let mapleader = ","

" Snipmate key settings
"let g:SuperTabMappingForward="<c-space>"
"let g:SuperTabMappingBackward="<s-space>"

" Reload command-t cache using captial T
map <leader>T :CommandTFlush<CR>:CommandT<CR>
map <leader>t :CommandT<CR>

" Nerdtree bindings
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" re-indent the whole file, remove unnecessary whitespace
map <leader>i :call<SID>ReformatAndClean()<CR>

" Open my custom help file
map <leader>c :tabe ~/.vim/doc/cheetSheet.txt<CR>

" Edit or load .vimrc
nmap <silent> ,ev :tabe $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Move the cursor to the window in the proper direction
noremap <silent> ,h :wincmd h<cr>
noremap <silent> ,j :wincmd j<cr>
noremap <silent> ,k :wincmd k<cr>
noremap <silent> ,l :wincmd l<cr>

" Move the cursor to move the window itself
noremap <silent> ,H :wincmd H<cr>
noremap <silent> ,J :wincmd J<cr>
noremap <silent> ,K :wincmd K<cr>
noremap <silent> ,L :wincmd L<cr>

" Replace all instances of the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" no goofy buttons
set guioptions=ac
:color blackboard  
set history=10000

" Better tab settings
set sts=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

set backspace=start,eol,indent

" Highlights matches when searching
set incsearch

" Automatically read and write files as needed
set autoread
set autowrite

" With these options together, we only use case sensitive search when there is a captial letter in the search term
set ignorecase
set smartcase

filetype on
filetype plugin on
filetype indent on

syntax on
syntax sync fromstart

set lazyredraw

" completion on the command line
set wildmenu
set wildmode=list:longest

" numbered lines
set number

" Prevents searched terms from remaining highlighted once search is done
set nohlsearch

set paste

" word wrapping
set wrap
set lbr

" no beeps
set vb

" Ignore directories that have crap in them
set wildignore+=vendor,tmp,target,.privatebuild

" My Favorite font
set guifont=Inconsolata:h16.00

" central backup directories
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Disable F1 help
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

" Add more info in status line
set statusline=%F%m%r%h%w\ [Line=%03l,Col=%03v][%p%%]\ [Type=%y]
set laststatus=2

" Remap Cmd-S to: Save All; Return to normal mode
" FIXME Not sure this works!
inoremenu File.Save <Esc>:wa<CR>

" Snipmate key settings
let g:SuperTabMappingForward="<c-space>"
let g:SuperTabMappingBackward="<s-space>"

" Remap omni-completion to CTRL+Space
nmap <C-space> ea<C-n>
imap <C-space> <C-n>

" Even though this is in specky, if we don't do it here it doesn't take
au BufRead,BufNewFile *_spec.rb set filetype=rspec

let vimclojure#ParenRainbow=1
let vimclojure#HighlightBuiltins=1
let g:vimclojure#ParenRainbowColorsDark = {
      \ '0': 'ctermfg=red         guifg=red',
      \ '1': 'ctermfg=green       guifg=green',
      \ '2': 'ctermfg=yellow      guifg=yellow1',
      \ '3': 'ctermfg=magenta     guifg=purple1',
      \ '4': 'ctermfg=darkyellow  guifg=orange1',
      \ '5': 'ctermfg=blue        guifg=slateblue1',
      \ '6': 'ctermfg=yellow      guifg=yellow1',
      \ '7': 'ctermfg=darkgreen   guifg=magenta1',
      \ '8': 'ctermfg=red         guifg=darkviolet'
      \ }

function! <SID>ReformatAndClean()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")

  "Replace tabs with spaces
  :1,$retab 
  "Removing Trailing whitespace
  %s/\s\+$//e 
  "Reindent the file
  :normal gg=G 

  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)  
endfunction
