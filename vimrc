" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible              " be iMproved, required

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
"""""""""""""""""""""""""""""""""""
"====>scripts on GitHub repos
"""""""""""""""""""""""""""""""""""
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"====>scripts from http://vim-scripts.org/vim/scripts.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'L9'
Plugin 'FuzzyFinder'

""""""""""""""""""""""""""""""""""""
"====>scripts not on GitHub
""""""""""""""""""""""""""""""""""""
"Plugin 'git://git.wincent.com/command-t.git'
Plugin 'wincent/command-t'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"====>git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
"==>>Color themes 
"""""""""""""""""""""""""""""
Plugin 'desert.vim'
"A slightly-modified desert theme, for 88-and 256-color xterms
Plugin 'desert256.vim'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Railscasts-Theme-GUIand256color'
Plugin 'nanotech/jellybeans.vim'

Plugin 'CSApprox'
Plugin 'Valloric/YouCompleteMe'             " Code complete
Plugin 'scrooloose/syntastic'               " Syntax Check plugin
Plugin 'nathanaelkane/vim-indent-guides'    " Code indent guide
Plugin 'SirVer/ultisnips'                   " Sinppet
Plugin 'scrooloose/nerdtree'                " File Tree browser
Plugin 'majutsushi/tagbar'                  " TagBar
Plugin 'Lokaltog/vim-powerline'             " Status bar
Plugin 'vim-scripts/DrawIt'                 " ASCII art style comment
Plugin 'scrooloose/nerdcommenter'           " Fast comment and uncomment
Plugin 'lilydjwg/fcitx.vim'                 " Switch between eng and zh smoothly
Plugin 'suan/vim-instant-markdown'          " markdown previewer
Plugin 'sjl/gundo.vim'                      " undo and redo histories save in a tree not a stack

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set history=50		" keep 50 lines of command line history
set nowrap

set wildmenu        " cmd auto complete

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a      "use mouse in all mode
  "set mouse=nv     "use mouse only in normal an visual mode
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Show the bars and stars, especially useful in Vim user-manual
"set conceallevel=0
"hi link HelpBar Normal
"hi link HelpStar Normal

"""""""""""""""""""""""""""""""""""""""""
"==>Indent                     
""""""""""""""""""""""""""""""""
filetype indent on
"Indenting C style text
set cindent shiftwidth=4
set expandtab   " expand table as spaces
set tabstop=4
set shiftwidth=4
" Treat continuous 4 spaces as a tab
set softtabstop=4
set smarttab    " insert tabs on the start of a line according to shiftwidth, not tabstop

"""""""""""""""""""""""""""""""""""""""""""""
"==>Show line number, etc.
"""""""""""""""""""""""""""""""""""""""""""""
set number 		"Show line number
"set cursorline 		"Highlight current line
"set cursorcolumn  	    "Highlight current column
set laststatus=2	    " Always show status bar
set ruler		        " show the cursor position all the time
set showcmd		        " display incomplete commands
set incsearch           " show search matches as you type
set smartcase           " ignore case if search pattern is all lowercase, case-sensitive otherwise
set ignorecase          " ignore case if search pattern is all lowercase, case-sensitive otherwise
set hlsearch            " highlight search terms"
set showmatch           " set show match partterns

""""""""""""""""""""""""""""""""""""""""""""
"==>Key Mapping
"""""""""""""""""""""""""""""""""""""""""""
"The defalut <Leader> key is "\"
"let mapleader=";" "set the leader key
"""""""""""""""""""""""""""""""""""""""""""""""""""
""Brackets auto complete
"""""""""""""""""""""""""""""""""""""""""""""""""""
"inoremap ( ()<Left>
"inoremap [ []<Left>
"inoremap { {}<Left><Enter><Esc>O
"inoremap < <><Left>
"inoremap " ""<Left>
"inoremap ' ''<Left>
function! AutoPair(open, close)
        let line = getline('.')
        if col('.') > strlen(line) || line[col('.') - 1] == ' '
                return a:open.a:close."\<ESC>i"
        else
                return a:open
        endif
endf

function! ClosePair(char)
        if getline('.')[col('.') - 1] == a:char
                return "\<Right>"
        else
                return a:char
        endif
endf

function! SamePair(char)
        let line = getline('.')
        if col('.') > strlen(line) || line[col('.') - 1] == ' '
                return a:char.a:char."\<ESC>i"
        elseif line[col('.') - 1] == a:char
                return "\<Right>"
        else
                return a:char
        endif
endf

inoremap ( <c-r>=AutoPair('(', ')')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { <c-r>=AutoPair('{', '}')<CR>
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ <c-r>=AutoPair('[', ']')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
"inoremap < <c-r>=AutoPair('<', '>')<CR>
inoremap " <c-r>=SamePair('"')<CR>
inoremap ' <c-r>=SamePair("'")<CR>
inoremap ` <c-r>=SamePair('`')<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"====>CSApprox
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"Dont load this plugin
let g:CSApprox_loaded=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""===>Colors and Font
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim can guess the backgroud color, but sometime it may be wrong
"set background=light
"set background=dark

"Enable syntax highlighting
syntax enable
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    set t_Co=256
    syntax on
    set hlsearch
endif
"other options for gnome-terminal and linux console
"if &term=~"xterm"
"endif
"extra options for vim working in console
"dont export TERM in ~/.bashrc other the console will
"not be considered as "linux"
if &term=~"linux"
    colorscheme solarized
    set background=dark
endif
"Set extra options when running in GVim
if has("gui_running")
    "Dont show menu bar and tools bar
    "set guioptions-=T
    "set guioptions+=e
    "set guitablabel=%M\ %t
    set background=dark
    colorscheme solarized
endif


"colorscheme solarized
"colorscheme desert256
"colorscheme desert
"colorscheme railscasts
"colorscheme molokai
"colorscheme jellybeans

""""""""""""""""""""""""""""""""""""""""""""""
"==>Powerline
""""""""""""""""""""""""""""""""""""""""""""""
let g:Powerline_colorscheme='solarized256'

""""""""""""""""""""""""""""""""""""""""""""""
"==>NERDtree
""""""""""""""""""""""""""""""""""""""""""""""
"Key mapping to show Current Working Directory
"Set as <Leader>fl, means:file list
nmap <Leader>fl :NERDTreeToggle<CR>
"Put the NERDtree window on the right side
let NERDTreeWinPos="left"
"set the windows size when the NERDtree is opened
let NERDTreeWinSize=28
"Disable display of the 'Bookmarks' label and 'Press ? for help' text
let NERDTreeMinimalUI=1
"Automatically remove a buffer when a file is being deleted or renamed
let NERDTreeAutoDeleteBuffer=1

"""""""""""""""""""""""""""""""""""""""""""""""
"==>Code fold
"""""""""""""""""""""""""""""""""""""""""""""""
"folding based on syntax or indent
"set foldmethod=indent
set foldmethod=syntax

"disable code folding when starting vim
set nofoldenable

"""""""""""""""YouCompleteME"""""""""""""""""""
"Set the error and warning symbols if necessary
"If they are not set, YCM will fall back to the value of the syntastic 
"the value of  g:syntastic_warning_symbol and g:syntastic_error_symbol
let g:ycm_server_python_interpreter="/usr/bin/python"
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
"Enable tag completer
let g:ycm_collect_identifiers_from_tags_files = 1
"Enable syntax completer
let g:ycm_seed_identifiers_with_syntax = 1
"Dont show split window when accept a listing item
set completeopt-=preview
"Turn off the message that notice you to confirm when opening a file
let g:ycm_confirm_extra_conf=0
"Disable cache, recreate matching patterns every time
let g:ycm_cache_omnifunc=0
"Set Completer available when typing commentary
let g:ycm_complete_in_comments=1
"Start completer when typing the first letter
let g:ycm_min_num_of_chars_for_completion=1
"query the UltiSnips for possible completion of snippets
let g:ycm_use_ultisnips_completer=1

""""""""""""""""Syntastic""""""""""""""""""""""
"If synatss check in python is slow, then don't let it check python
"let g:syntastic_ignore_files=[".*\.py$"]
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
"Dont have to set if they are set in YCM options
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"whether to show balloons
let g:syntastic_enable_balloons = 1

""""""""""""""""vim-indent-guides""""""""""""""""""""""
"start up with vim
let g:indent_guides_enable_on_vim_starup=1
"Auto calculates the highlight colors
let g:indent_guides_auto_colors=1
"The percent at which the highlight colors will be lightened or darkened
let g:indent_guides_color_change_percent=10
"How many indent level to display guides for,default 30
let g:indent_guides_indent_levels=30
"from which level starting to show indent guides
let g:indent_guides_start_level=2
"the size of indent guide
let g:indent_guides_guide_size=1
"consider spaces as indention
let g:indent_guides_space_guides=1
"whether the default mapping(<leader>ig) gets set,default 1,values 0 or 1
let g:indent_guides_default_mapping=1
"mapping for toggling indent guides,the default is <leader>ig
":nmap <silent> <leader>i <Plug>IndentGuidesToggle

""""""""""""""ultiSnips"""""""""""""""""""""""""""
set runtimepath+=~/.vim/bundle/ultisnips
"The default key is <tab>,which has been set to YCM, so remapping
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
"Define the private snippets definition files are stored in.
"Creat my own sinppets file here, for example: cpp.snippets
"In the past edition, this directory is the default directory for snippets,
"there used to be some snippets. But now I have to create it by myself.
"let g:UltiSnipsSnippetDirectories=["UltiSnips"]
"Attetntion!!:this file can not be named as "snippets"
let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/UltiSnips"

"""""""""""""""Instant markdown previewer"""""""""""""""""""""""""
" Refresh the previewer only on the following events:
" 1. No Keys have been pressed for a while
" 2. A while after leaving insert mode
" 3. save the file being edited
let g:instant_markdown_slow = 1
" Auto launch the preview window
" If it is 0, trigger preview via the command :InstantMarkdownPreview
let g:instant_markdown_autostart = 0

"""""""""""""""Tagbar"""""""""""""""""""""""
"let g:tagbar_left=1
let g:tagbar_right=1
nnoremap <leader>tl :TagbarToggle<CR>
let g:tagbar_with=30
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
            \ 'ctagstype' : 'c++',
            \ 'kinds'     : [
                \ 'd:macros:1:0',
                \ 'p:prototypes:1:0',
                \ 'g:enums',
                \ 'e:enumerators:0:0',
                \ 't:typedefs:0:0',
                \ 'n:namespaces',
                \ 'c:classes',
                \ 's:structs',
                \ 'u:unions',
                \ 'f:functions',
                \ 'm:members:0:0',
                \ 'v:variables:0:0'
            \ ],
            \ 'sro'        : '::',
            \ 'kind2scope' : {
                \ 'g' : 'enum',
                \ 'n' : 'namespace',
                \ 'c' : 'class',
                \ 's' : 'struct',
                \ 'u' : 'union'
            \ },
            \ 'scope2kind' : {
                \ 'enum'      : 'g',
                \ 'namespace' : 'n',
                \ 'class'     : 'c',
                \ 'struct'    : 's',
                \ 'union'     : 'u'
            \ }
        \ }

let g:tagbar_type_c = {
            \ 'kinds' : [
                \ 'd:macros:1',
                \ 'g:enums',
                \ 't:typedefs:0:0',
                \ 'e:enumerators:0:0',
                \ 'n:namespaces',
                \ 'c:classes',
                \ 's:structs',
                \ 'u:unions',
                \ 'f:functions',
                \ 'm:members:0:0',
                \ 'v:variables:0:0'
            \ ]
        \ }
