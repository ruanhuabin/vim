autocmd VimEnter * wincmd l

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

syntax on 
"nmap <F9> :SingleCompile<cr><cr><cr> 
"nmap <F10> :SingleCompileRun<cr><cr><cr>
"noremap <F5> :w<cr>
let mapleader = "\\"
"nmap <leader>w :w!<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc  

if has("autocmd")
	 autocmd BufRead *.txt set tw=78
	 autocmd BufReadPost *
	 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
	 \   exe "normal g'\"" |
	 \ endif
endif
set history=1000
set autoread
set hlsearch "Highlight search things
set incsearch
set nu
set nobackup
set whichwrap+=<,>,h,l
"use \gg to first line in insert mode
map! <leader>gg <Esc>gg<cr>i
"use \w to save file in any mode
map! <leader>w <Esc>:w<cr>a
nmap <leader>w <Esc>:w<cr>
vmap <leader>w <Esc>:w<cr>

"use \a to switch between header and source
map! <leader>a <Esc>:A<cr>
nmap <leader>a <Esc>:A<cr>
vmap <leader>a <Esc>:A<cr>
"use \av to switch between header and source in same window(Vertical split)
map! <leader>av <Esc>:AV<cr>
nmap <leader>av <Esc>:AV<cr>
vmap <leader>av <Esc>:AV<cr>
"use \as to switch between header and source in same window(Horizontal split)
map! <leader>as <Esc>:AS<cr>
nmap <leader>as <Esc>:AS<cr>
vmap <leader>as <Esc>:AS<cr>
"use \x to quit and save 
map! <leader>x <Esc>:wq<cr>
nmap <leader>x <Esc>:wq<cr>
vmap <leader>x <Esc>:wq<cr>
"use \xx to quit and not save
map! <leader>xx <Esc>:q!<cr>
nmap <leader>xx <Esc>:q!<cr>
vmap <leader>xx <Esc>:q!<cr>
"use \ax to quit and save all open window
map! <leader>ax <Esc>:wqa<cr>
nmap <leader>ax <Esc>:wqa<cr>
vmap <leader>ax <Esc>:wqa<cr>
"use \axx to quit but not save all open window
map! <leader>axx <Esc>:qa!<cr>
nmap <leader>axx <Esc>:qa!<cr>
vmap <leader>axx <Esc>:qa!<cr>

set tags+=~/.vim/tags/tags
set tags+=~/.vim/tags/axis2ctags
set tags+=~/.vim/tags/berkeleytags
set tags+=~/.vim/tags/cstltags
set tags+=~/.vim/tags/standardctags
set tags+=~/.vim/tags/cpptags
set tags+=~/.vim/tags/full_c_cpp_tags_usr_src
set tags+=~/.vim/tags/full_c_cpp_tags_usr_include
set tags+=~/.vim/tags/javatags

"set tags+=~/.vim/tags/full_c_cpp_tags.bak
map! <leader>3 <Esc>:!./%<CR>

"Mouse enable
set mouse=a
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  set csverb
endif

nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
 let Tlist_Ctags_Cmd = '/usr/bin/ctags'
 let Tlist_Show_One_File = 1        
 let Tlist_Exit_OnlyWindow = 1 
" let Tlist_Auto_Open = 1
 let Tlist_Use_SingleClick = 1
 "let Tlist_Exit_OnlyWindow = 1
 let Tlist_Use_Right_Window = 1
 let Tlist_Sort_Type = "name"
 let Tlist_WinWidth = 20 
"NERDtree settings
"let loaded_nerd_tree = 1
"let NERDTreeShowFiles = 1
let NERDTreeWinPos = "left"
let NERDTreeWinSize = 20
nmap <F7> <ESC>:NERDTreeToggle<CR>
"let loaded_winmanager = 1 
let g:winManagerWindowLayout='TagList|FileExplorer,BufExplorer'
"let g:winManagerWindowLayout='TagList'
let g:AutoOpenWinManager = 0
 set foldmethod=marker
 colorscheme motus

 "C program compile and run
map! <leader>v <ESC>Mi 
nmap <leader>v :call CompileRunMPI()<CR><CR>
vmap <leader>v :call CompileRunMPI()<CR><CR>
nmap M :call CompileRunMPI()<CR><CR>
func! CompileRunMPI()
 exec "w"
 exec "!mpicc % -o %< -L/home/ruanhuabin/p1netcdf//lib /home/ruanhuabin/Downloads/netcdf-4.1.1/libsrc4/.libs/libnetcdf.a /home/ruanhuabin/hdf5/lib/libhdf5_hl.a -lm -lz -lpnetcdf -lhdf5"
 exec "! mpdcleanup"
 exec "! mpd &"
 exec "! sleep 1"
 exec "! mpiexec -n 4 ./%<"
endfunc

map! <leader>rmc <ESC>Ri
vmap <leader>rmc :call RunClean()<CR><CR>
nmap <leader>rmc :call RunClean()<CR><CR>
nmap R :call RunClean()<CR><CR>
func! RunClean()
	exec "!clear"
	exec "!make clean"
	exec "!read"
endfunc

nmap <leader>fc :call RunCodeFormat()<CR><CR>
func! RunCodeFormat()
	exec "!~/.vim/script/csft.sh %"
    exec "!read"
endfunc
nmap <leader>fca :call RunCodeFormatAll()<CR><CR>
func! RunCodeFormatAll()
	exec "!~/.vim/script/csft.sh ."
    exec "!read"
endfunc

"Run make install
"map! <leader>rmi <ESC>Ni
"vmap <leader>rmi :call RunInstall()<CR><CR>
"nmap <leader>rmi :call RunInstall()<CR><CR>
"nmap N :call RunInstall()<CR><CR>
"func! RunInstall()
	"exec "!clear"
	"exec "!make install"
	"exec "!read"
"endfunc

"Run make
map! <leader>rb <ESC>Xi
vmap <leader>rb :call RunMake()<CR><CR>
nmap <leader>rb :call RunMake()<CR><CR>
nmap X :call RunMake()<CR><CR>
func! RunMake()
	exec "make"
	exec "cw"
endfunc
"Run Program
map! <leader>rmr <ESC>Ki
vmap <leader>rmr :call RunProgram()<CR><CR>
nmap <leader>rmr :call RunProgram()<CR><CR>
nmap K :call RunProgram()<CR><CR>
func! RunProgram()
	exec "!clear"
	exec "!./%<"
	exec "!read"
endfunc

"Generate ctags symbol
map! <leader>t <ESC>Ti
vmap <leader>t :call GenCTags()<CR><CR>
nmap <leader>t :call GenCTags()<CR><CR>
nmap T :call GenCTags()<CR><CR>
func! GenCTags()
	exec "!clear"
	exec "!ctags -R --languages=\"c,c++,java\" --c-kinds=+px --c++-kinds=+px  --fields=+iaS --extra=+q"
	exec "!read"
endfunc
"Generate cscope database
map! <leader>r <ESC>Yi
vmap <leader>r :call GenCscope()<CR><CR>
nmap <leader>r :call GenCscope()<CR><CR>
nmap Y :call GenCscope()<CR><CR>
func! GenCscope()
	exec "!clear"
	exec "!rm cscope.files cscope.in.out cscope.po.out cscope.out"
	exec "!find . -name \"*.h\" -o -name \"*.c\" -o -name \"*.cpp\" -o -name \"*.cc\"  >cscope.files"
	exec "!cscope -bq -i cscope.files"
	exec "cs reset"
	exec "cs add cscope.out"
endfunc
let NERDComInsertMap='<c-c>'
" switch to next fun declaration
let g:EchoFuncKeyNext='<c-j>'
" switch to previous fun declaration
"let g:EchoFuncKeyPrev='<c-k>'

"This variable is used in c.vim
"let g:C_MapLeader=","
set fdm=marker
imap jj <Esc>
nmap <silent> <F2> :WMToggle<CR>
map! <silent> <F2> <ESC><F2>i
