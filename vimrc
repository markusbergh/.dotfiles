set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8
set updatetime=100

" vundle {

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'scrooloose/syntastic'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'ervandew/supertab'
  Plugin 'ryanoasis/vim-devicons'
  Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plugin 'mtscout6/syntastic-local-eslint.vim'

  " Vundle git plugins
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'tpope/vim-fugitive'

  " Vundle file extensions
  Plugin 'mxw/vim-jsx'
  Plugin 'JulesWang/css.vim'
  Plugin 'pangloss/vim-javascript'
  Plugin 'keith/swift.vim'

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

" }

" Syntax highlighting {
  
  " Enable syntax highlighting
  syntax enable

  " Set background
  set background=dark

  highlight String ctermfg=42
  highlight Comment ctermfg=245
  highlight MatchParen ctermbg=15 ctermfg=0
  highlight Todo ctermfg=red ctermbg=NONE

  " JavaScript syntax highlighting
  highlight jsModuleKeywords ctermfg=135
  highlight jsTemplateBraces ctermfg=161
  highlight jsTemplateExpression ctermfg=15
  highlight jsClassMethodType ctermfg=42
  highlight jsNull ctermfg=42
  highlight jsVariableDef ctermfg=NONE
  highlight jsModuleOperators ctermfg=135
  highlight jsConditional ctermfg=135
  highlight jsLabel ctermfg=135
  highlight jsStatement ctermfg=135
  highlight jsModuleDefault ctermfg=161
  highlight jsStorageClass ctermfg=135
  highlight jsSwitchColon ctermfg=39
  highlight jsObjectColon ctermfg=39
  highlight jsFunction ctermfg=135
  highlight jsFuncName ctermfg=81
  highlight jsFuncCall ctermfg=81
  highlight jsArrowFunction ctermfg=135
  highlight jsOperator ctermfg=39
  highlight jsBooleanTrue ctermfg=161
  highlight jsBooleanFalse ctermfg=161
  highlight jsGlobalObjects ctermfg=161
  highlight jsNumber ctermfg=161
  highlight xmlTagName ctermfg=161
  highlight xmlEndTag ctermfg=161
  highlight xmlTag ctermfg=161
  highlight xmlAttrib ctermfg=42

  " CSS syntax highlighting
  highlight cssSelector ctermfg=220
  highlight cssClassName ctermfg=220
  highlight cssFunctionName ctermfg=15
  highlight cssValueNumber ctermfg=15
  highlight cssValueAngle ctermfg=15
  highlight cssVendor ctermfg=42
  highlight cssProp ctermfg=42
  highlight cssAttr ctermfg=15
  highlight cssClassNameDot ctermfg=220
  highlight cssTagName ctermfg=220
  highlight cssBraces ctermfg=220
  highlight cssCommonVal ctermfg=15
  highlight cssValueLength ctermfg=15
  highlight cssUnitDecorators ctermfg=220
  highlight cssAdvancedVal ctermfg=42
  highlight cssVisualVal ctermfg=15
  highlight cssRuleProp ctermfg=135
  highlight cssValueTime ctermfg=15
  highlight cssKeyFrameSelector ctermfg=15
  highlight cssColor ctermfg=15
  highlight cssPseudoClassId ctermfg=15
  highlight cssFunctionComma ctermfg=15
  highlight cssValueNumber ctermfg=15
  highlight cssMediaProp ctermfg=15 

  " NERDTree syntax highlighting
  highlight NERDTreeDir ctermfg=255
  highlight NERDTreeDirSlash ctermfg=255
  highlight NERDTreeFile ctermfg=7
  highlight NERDTreeOpenable ctermfg=255
  highlight NERDTreeClosable ctermfg=255
  highlight NERDTreeLinkFile ctermfg=255
  highlight NERDTreeLinkDir ctermfg=255
  highlight NERDTreeLinkTarget ctermfg=255
  highlight NERDTreeExecFile ctermfg=10

" Editor {

  " Invisible characters
  set list
  set listchars=eol:¬,tab:··,trail:·,extends:>,precedes:<,space:·
  highlight SpecialKey ctermfg=238
  highlight NonText ctermfg=238

  " Line numbers
  set number
  highlight LineNr ctermfg=8

  " Highlight line
  set cursorline
  highlight CursorLineNr cterm=NONE ctermfg=7
  highlight CursorLine ctermbg=236 cterm=NONE

  " Search
  highlight Search ctermfg=22 ctermbg=10
  highlight IncSearch ctermfg=22 ctermbg=10 cterm=NONE
  set incsearch
  set ignorecase
  set hls

  " Do not jump forward when doing search for the
  " word under the cursor
  nnoremap * :keepjumps normal! mi*`i<CR>

  " Clear highlighting on escape in normal mode
  nnoremap <silent> <esc> :noh<return>
  nnoremap <esc> <esc>

  " Matching parentheses/blocks
  highlight MatchParent cterm=bold ctermfg=16 ctermbg=15

  " set the cursor to a vertical line in insert mode and a solid block
  " in command mode
  let &t_SI = "\<esc>\<esc>\<esc>]50;CursorShape=1\x7\<esc>\\"
  let &t_EI = "\<esc>\<esc>\<esc>]50;CursorShape=0\x7\<esc>\\"
  set timeout timeoutlen=1000 ttimeoutlen=10

  " Hide default mode indicator
  set noshowmode

  " Colorcolumn
  :set colorcolumn=80 
  highlight colorcolumn ctermbg=236

  " Always show current position
  set ruler

  " Return to last edit position when opening files
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " Turn backup off since files are run in git etc.
  set nobackup
  set nowb
  set noswapfile

  " No annoying sound on errors
  set noerrorbells
  set t_vb=
  set tm=500

  " Do not let cursor scroll below or above N number of lines when scrolling.
  set scrolloff=5

" }

" Keys {

  " Change leader key
  let mapleader = ","

  " Configure backspace so it acts as it should act
  set backspace=eol,start,indent
  set whichwrap+=<,>,h,l

  " Delete word by holding option key
  imap <Esc><BS> <C-w>

  " Move line up/down
  nnoremap <S-Up> :m-2<CR>
  nnoremap <S-Down> :m+<CR>

  " Switch tabs with <Alt-Left>/<Alt-Right>
  set <F13>=f
  set <F14>=b
  nnoremap <F13> :tabnext<CR>
  nnoremap <F14> :tabprev<CR>

" }

" Indention {

  set expandtab " Spaces instead of tabs
  set shiftwidth=2 " 1 tab = 2 spaces
  set tabstop=2
  set softtabstop=2
  set smarttab
  set ai "Auto indent
  set si "Smart indent
  set nowrap "Do not wrap lines 

  autocmd FileType php setlocal noexpandtab ai si nowrap
  autocmd FileType htmlcheetah setlocal noexpandtab ai si nowrap

" }

" ctrlp {

  " Custom ignore
  let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

  " Set no max file limit
  let g:ctrlp_max_files = 0

  " Search from current directory instead of project root
  let g:ctrlp_working_path_mode = 0

  " Ignore files from .gitignore
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" }

" NERDTree {

  " NERDTree toggle (,f)
  nnoremap <Leader>f :NERDTreeToggle<Enter>

  " Open file in NERDTree (,v)
  nnoremap <silent> <Leader>v :NERDTreeFind<CR>

  " Delete the buffer of the file just deleted by NERDTree
  let NERDTreeAutoDeleteBuffer = 1

  " Look of NERDTree
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let NERDTreeShowHidden = 1
  let g:NERDTreeWinSize = 40

  " Fixes the plugin mess of nerdtree-git-plugin and syntastic
  let NERDTreeGitStatusUpdateOnWrite  = 0

  " Quit NERDTree when last buffer
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " Git symbols
  let g:NERDTreeGitStatusUseNerdFonts = 1 
  
  let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ "Modified"  : "~",
      \ "Staged"    : "+",
      \ "Untracked" : "+",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "~",
      \ "Clean"     : "✔︎",
      \ "Unknown"   : "?"
      \ }

  " Git diff colors
  let g:NERDTreeGitStatusHighlightingCustom = {}
  let g:NERDTreeGitStatusHighlightingCustom['Untracked'] = 'ctermfg=green'
  let g:NERDTreeGitStatusHighlightingCustom['Modified'] = 'ctermfg=yellow'
  let g:NERDTreeGitStatusHighlightingCustom['Dirty'] = 'ctermfg=yellow'

" }

" Airline {

  let g:airline_powerline_fonts = 1
  
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#show_splits = 0
  let g:airline#extensions#tabline#show_tabs = 1
  let g:airline#extensions#tabline#show_tab_nr = 0
  let g:airline#extensions#tabline#show_tab_type = 0
  let g:airline#extensions#tabline#close_symbol = 'Ã—'
  let g:airline#extensions#tabline#show_close_button = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#right_sep = ''
  let g:airline#extensions#tabline#right_alt_sep = '|'
  
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  
  let g:airline#extensions#hunks#enabled = 0
  let g:airline#extensions#whitespace#enabled = 0
  
  let g:airline_section_c = '%t'

" }

" Syntastic {

  " Syntastic
  " set statusline+=%#warningmsg#
  " set statusline+=%{SyntasticStatuslineFlag()}
  " set statusline+=%*

  let g:syntastic_javascript_checkers = ['eslint']
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 1
  let g:syntastic_enable_signs = 1
  let g:syntastic_enable_highlighting = 1
  let g:syntastic_error_symbol = 'e:'
  let g:syntastic_warning_symbol = 'w:'

  " Highlight colors
  highlight SyntasticError ctermfg=NONE ctermbg=196
  highlight SyntasticErrorSign ctermfg=16 ctermbg=196
  highlight SyntasticWarning ctermfg=NONE ctermbg=226
  highlight SyntasticWarningSign ctermfg=0 ctermbg=226
  highlight SpellBad ctermfg=15 ctermbg=196

" }

" Supertab {

  " Pop-up menu highlighting
  highlight Pmenu ctermbg=27
  highlight PmenuSel ctermbg=20 ctermfg=15

  " Selecting in Supertab should not make a new line
  let g:SuperTabCrMapping = 1

" }

" Dev icons {

  let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" }

" NERDTree syntax highlighting {

  let s:aqua = "8eecf5"
  let s:green = "87ff00"

  let g:NERDTreeExtensionHighlightColor = {}
  let g:NERDTreeExtensionHighlightColor['sh'] = s:aqua
  let g:NERDTreeExtensionHighlightColor['bash'] = s:aqua

  let g:NERDTreePatternMatchHighlightColor = {}
  let g:NERDTreePatternMatchHighlightColor['vimrc'] = s:green

" }

" vim-jsx {

  " Add jsx support in JavaScript files
  let g:jsx_ext_required = 0

" }

" Fugitive {

  " Open git grep in quickfix window
  autocmd QuickFixCmdPost *grep* cwindow

" }

" Git gutter {

  let g:gitgutter_realtime = 0
  let g:gitgutter_eager = 0
  let g:gitgutter_set_sign_backgrounds = 1

  highlight SignColumn ctermbg=236

  highlight GitGutterAdd ctermfg=2
  highlight GitGutterChange ctermfg=3
  highlight GitGutterDelete ctermfg=1

" }
