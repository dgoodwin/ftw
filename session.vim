let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <C-Tab> =InsertTabWrapper ("startkey")
inoremap <S-Tab> =InsertTabWrapper ("backward")
nmap  $
nmap  h
nmap 	 :JavaImport
nmap <NL> j
nmap  k
nmap  l
nmap <silent>  :silent noh
map  :w
nmap  :JavaSearch 
noremap   <PageDown>  " Use spacebar to scroll down
nmap # #zz
nmap * *zz
map ,e :e =expand("%:p:h") . "/" 
nmap ,V :e ~/.vimrc
nmap ,S :source ~/.vimrc
map ,time :let @z=strftime("%H:%M:%P %Z")"zpa
map ,date :let @z=strftime("%Y-%m-%d %a @ %H:%M%P %Z")"zpa
map ,L mz1G/Last modified:/eCYDATETIME`z
vnoremap < <gv
vnoremap > >gv
nmap N Nzz
vmap [% [%m'gv``
nmap <silent> \sl <Plug>SpellChangeLanguage
nmap <silent> \s? <Plug>SpellProposeAlternatives
nmap <silent> \sA <Plug>SpellAutoEnable
nmap <silent> \ss <Plug>SpellCheck
nmap \ch <Plug>CalendarH
nmap \ca <Plug>CalendarV
map <silent> \bv :VSBufExplorer
map <silent> \bs :SBufExplorer
map <silent> \be :BufExplorer
map \p gqap
map \tc :call ToggleTabCompletion()
vmap ]% ]%m'gv``
vmap a% [%v]%
nmap gx <Plug>NetrwBrowseX
nmap g# g#zz
nmap g* g*zz
nmap n nzz
vnoremap p :let current_reg = @"gvdi=current_reg
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nnoremap <silent> <Plug>SpellMenuAlternatives :SpellMenuAlternatives
nnoremap <silent> <Plug>SpellProposeAlternatives :SpellProposeAlternatives
nnoremap <silent> <Plug>SpellAutoDisable :SpellAutoDisable
nnoremap <silent> <Plug>SpellAutoEnable :SpellAutoEnable
nnoremap <silent> <Plug>SpellChangeLanguage :SpellChangeLanguage
nnoremap <silent> <Plug>SpellExit :SpellExit
nnoremap <silent> <Plug>SpellCheckLine :SpellCheckLine
nnoremap <silent> <Plug>SpellCheck :SpellCheck
nmap <silent> <Plug>CalendarH :cal Calendar(1)
nmap <silent> <Plug>CalendarV :cal Calendar(0)
map <M-Down> ddp
map <M-Up> dd-P
nnoremap <F6> :%s/\<\>/
map <F12> :set nu!
map <F11> :set wrap!
map <F8> :WMToggle
map <F7> \mbt
map <F5> \be
map <F3> :b#
map <F2> :bn
map <F1>:set noexpandtab
imap  0i
imap  $a
inoremap 	 =InsertTabWrapper ("forward")
imap  
imap  u
abbr sysout System.out.println
iabbr YDATETIME =strftime(": %a %b %d, %Y %H:%M:%S %Z")
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autowrite
set backspace=2
set cinoptions=(0
set expandtab
set fileencodings=ucs-bom,utf-8,latin1
set formatoptions=tcql
set gdefault
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,a:blinkon0
set guifont=Monospace\ 10
set helplang=en
set hidden
set history=50
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set ruler
set shiftwidth=2
set showcmd
set showmatch
set statusline=[%02n]\ %f\ %([%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set tabstop=2
set termencoding=utf-8
set tildeop
set updatetime=2000
set viminfo='20,\"50
set whichwrap=h,l,~,[,]
set window=50
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +19 ~/src/ftw/app/controllers/home_controller.rb
badd +19 ~/src/ftw/app/controllers/leagues_controller.rb
badd +21 ~/src/ftw/app/controllers/application_controller.rb
badd +0 ~/src/ftw/app/models/league.rb
badd +1 ~/src/ftw/app/views/leagues/show.html.erb
badd +0 ~/src/ftw/app/views/layouts/application.html.erb
silent! argdel *
edit ~/src/ftw/app/controllers/leagues_controller.rb
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 103 + 103) / 207)
exe 'vert 2resize ' . ((&columns * 103 + 103) / 207)
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=(0
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetRubyIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,/usr/lib/ruby/site_ruby/1.8,/usr/lib64/ruby/site_ruby/1.8,/usr/lib64/ruby/site_ruby/1.8/x86_64-linux,/usr/lib/ruby/site_ruby,/usr/lib64/ruby/site_ruby,/usr/lib64/site_ruby/1.8,/usr/lib64/site_ruby/1.8/x86_64-linux,/usr/lib64/site_ruby,/usr/lib/ruby/1.8,/usr/lib64/ruby/1.8,/usr/lib64/ruby/1.8/x86_64-linux,,~/.gem/ruby/1.8/gems/Antwrap-0.7.0/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.5/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.5/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.5/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.5/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.5/lib,~/.gem/ruby/1.8/gems/archive-tar-minitar-0.5.2/lib,~/.gem/ruby/1.8/gems/builder-2.1.2/lib,~/.gem/ruby/1.8/gems/buildr-1.3.3/lib,~/.gem/ruby/1.8/gems/highline-1.4.0/lib,~/.gem/ruby/1.8/gems/hoe-1.7.0/lib,~/.gem/ruby/1.8/gems/net-sftp-2.0.1/lib,~/.gem/ruby/1.8/gems/net-ssh-2.0.4/lib,~/.gem/ruby/1.8/gems/rack-1.0.1/lib,~/.gem/ruby/1.8/gems/rails-2.3.5/lib,~/.gem/ruby/1.8/gems/rake-0.8.1/lib,~/.gem/ruby/1.8/gems/rjb-1.1.6/lib,~/.gem/ruby/1.8/gems/rspec-1.1.5/lib,~/.gem/ruby/1.8/gems/rubyforge-1.0.0/lib,~/.gem/ruby/1.8/gems/rubyzip-0.9.1/lib,~/.gem/ruby/1.8/gems/webgen-0.5.7/lib,~/.gem/ruby/1.8/gems/xml-simple-1.0.11/lib,/usr/lib/ruby/gems/1.8/gems/Antwrap-0.7.0/lib,/usr/lib/ruby/gems/1.8/gems/archive-tar-minitar-0.5.2/lib,/usr/lib/ruby/gems/1.8/gems/builder-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/buildr-1.3.5/addon,/usr/lib/ruby/gems/1.8/gems/buildr-1.3.5/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.7.3/lib,/usr/lib/ruby/gems/1.8/gems/diff-lcs-1.1.2/lib,/usr/lib/ruby/gems/1.8/gems/gherkin-1.0.30/lib,/usr/lib/ruby/gems/1.8/gems/highline-1.5.1/lib,/usr/lib/ruby/gems/1.8/gems/hoe-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/i18n-0.3.6.pre/lib,/usr/lib/ruby/gems/1.8/gems/mime-types-1.16/lib,/usr/lib/ruby/gems/1.8/gems/net-sftp-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/net-ssh-2.0.15/lib,/usr/lib/ruby/gems/1.8/gems/rake-0.8.7/lib,/usr/lib/ruby/gems/1.8/gems/rest-client-1.5.1/lib,/usr/lib/ruby/gems/1.8/gems/rjb-1.1.9/lib,/usr/lib/ruby/gems/1.8/gems/rspec-1.2.8/lib,/usr/lib/ruby/gems/1.8/gems/rubyforge-1.0.5/lib,/usr/lib/ruby/gems/1.8/gems/rubygems-update-1.3.6/hide_lib_for_update,/usr/lib/ruby/gems/1.8/gems/rubyzip-0.9.1/lib,/usr/lib/ruby/gems/1.8/gems/xml-simple-1.0.12/lib
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 21 - ((19 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
21
normal! 060l
wincmd w
argglobal
edit ~/src/ftw/app/controllers/home_controller.rb
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=(0
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetRubyIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,/usr/lib/ruby/site_ruby/1.8,/usr/lib64/ruby/site_ruby/1.8,/usr/lib64/ruby/site_ruby/1.8/x86_64-linux,/usr/lib/ruby/site_ruby,/usr/lib64/ruby/site_ruby,/usr/lib64/site_ruby/1.8,/usr/lib64/site_ruby/1.8/x86_64-linux,/usr/lib64/site_ruby,/usr/lib/ruby/1.8,/usr/lib64/ruby/1.8,/usr/lib64/ruby/1.8/x86_64-linux,,~/.gem/ruby/1.8/gems/Antwrap-0.7.0/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.5/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.5/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.5/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.5/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.5/lib,~/.gem/ruby/1.8/gems/archive-tar-minitar-0.5.2/lib,~/.gem/ruby/1.8/gems/builder-2.1.2/lib,~/.gem/ruby/1.8/gems/buildr-1.3.3/lib,~/.gem/ruby/1.8/gems/highline-1.4.0/lib,~/.gem/ruby/1.8/gems/hoe-1.7.0/lib,~/.gem/ruby/1.8/gems/net-sftp-2.0.1/lib,~/.gem/ruby/1.8/gems/net-ssh-2.0.4/lib,~/.gem/ruby/1.8/gems/rack-1.0.1/lib,~/.gem/ruby/1.8/gems/rails-2.3.5/lib,~/.gem/ruby/1.8/gems/rake-0.8.1/lib,~/.gem/ruby/1.8/gems/rjb-1.1.6/lib,~/.gem/ruby/1.8/gems/rspec-1.1.5/lib,~/.gem/ruby/1.8/gems/rubyforge-1.0.0/lib,~/.gem/ruby/1.8/gems/rubyzip-0.9.1/lib,~/.gem/ruby/1.8/gems/webgen-0.5.7/lib,~/.gem/ruby/1.8/gems/xml-simple-1.0.11/lib,/usr/lib/ruby/gems/1.8/gems/Antwrap-0.7.0/lib,/usr/lib/ruby/gems/1.8/gems/archive-tar-minitar-0.5.2/lib,/usr/lib/ruby/gems/1.8/gems/builder-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/buildr-1.3.5/addon,/usr/lib/ruby/gems/1.8/gems/buildr-1.3.5/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.7.3/lib,/usr/lib/ruby/gems/1.8/gems/diff-lcs-1.1.2/lib,/usr/lib/ruby/gems/1.8/gems/gherkin-1.0.30/lib,/usr/lib/ruby/gems/1.8/gems/highline-1.5.1/lib,/usr/lib/ruby/gems/1.8/gems/hoe-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/i18n-0.3.6.pre/lib,/usr/lib/ruby/gems/1.8/gems/mime-types-1.16/lib,/usr/lib/ruby/gems/1.8/gems/net-sftp-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/net-ssh-2.0.15/lib,/usr/lib/ruby/gems/1.8/gems/rake-0.8.7/lib,/usr/lib/ruby/gems/1.8/gems/rest-client-1.5.1/lib,/usr/lib/ruby/gems/1.8/gems/rjb-1.1.9/lib,/usr/lib/ruby/gems/1.8/gems/rspec-1.2.8/lib,/usr/lib/ruby/gems/1.8/gems/rubyforge-1.0.5/lib,/usr/lib/ruby/gems/1.8/gems/rubygems-update-1.3.6/hide_lib_for_update,/usr/lib/ruby/gems/1.8/gems/rubyzip-0.9.1/lib,/usr/lib/ruby/gems/1.8/gems/xml-simple-1.0.12/lib
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 16 - ((14 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 038l
wincmd w
exe 'vert 1resize ' . ((&columns * 103 + 103) / 207)
exe 'vert 2resize ' . ((&columns * 103 + 103) / 207)
tabedit ~/src/ftw/app/views/layouts/application.html.erb
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 103 + 103) / 207)
exe 'vert 2resize ' . ((&columns * 103 + 103) / 207)
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=(0
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=:#
setlocal commentstring=<%#%s%>
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'eruby'
setlocal filetype=eruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetErubyIndent()
setlocal indentkeys=o,O,*<Return>,<>>,{,},0),0],o,O,!^F,=end,=else,=elsif,=rescue,=ensure,=when
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,/usr/lib/ruby/site_ruby/1.8,/usr/lib64/ruby/site_ruby/1.8,/usr/lib64/ruby/site_ruby/1.8/x86_64-linux,/usr/lib/ruby/site_ruby,/usr/lib64/ruby/site_ruby,/usr/lib64/site_ruby/1.8,/usr/lib64/site_ruby/1.8/x86_64-linux,/usr/lib64/site_ruby,/usr/lib/ruby/1.8,/usr/lib64/ruby/1.8,/usr/lib64/ruby/1.8/x86_64-linux,,~/.gem/ruby/1.8/gems/Antwrap-0.7.0/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.5/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.5/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.5/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.5/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.5/lib,~/.gem/ruby/1.8/gems/archive-tar-minitar-0.5.2/lib,~/.gem/ruby/1.8/gems/builder-2.1.2/lib,~/.gem/ruby/1.8/gems/buildr-1.3.3/lib,~/.gem/ruby/1.8/gems/highline-1.4.0/lib,~/.gem/ruby/1.8/gems/hoe-1.7.0/lib,~/.gem/ruby/1.8/gems/net-sftp-2.0.1/lib,~/.gem/ruby/1.8/gems/net-ssh-2.0.4/lib,~/.gem/ruby/1.8/gems/rack-1.0.1/lib,~/.gem/ruby/1.8/gems/rails-2.3.5/lib,~/.gem/ruby/1.8/gems/rake-0.8.1/lib,~/.gem/ruby/1.8/gems/rjb-1.1.6/lib,~/.gem/ruby/1.8/gems/rspec-1.1.5/lib,~/.gem/ruby/1.8/gems/rubyforge-1.0.0/lib,~/.gem/ruby/1.8/gems/rubyzip-0.9.1/lib,~/.gem/ruby/1.8/gems/webgen-0.5.7/lib,~/.gem/ruby/1.8/gems/xml-simple-1.0.11/lib,/usr/lib/ruby/gems/1.8/gems/Antwrap-0.7.0/lib,/usr/lib/ruby/gems/1.8/gems/archive-tar-minitar-0.5.2/lib,/usr/lib/ruby/gems/1.8/gems/builder-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/buildr-1.3.5/addon,/usr/lib/ruby/gems/1.8/gems/buildr-1.3.5/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.7.3/lib,/usr/lib/ruby/gems/1.8/gems/diff-lcs-1.1.2/lib,/usr/lib/ruby/gems/1.8/gems/gherkin-1.0.30/lib,/usr/lib/ruby/gems/1.8/gems/highline-1.5.1/lib,/usr/lib/ruby/gems/1.8/gems/hoe-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/i18n-0.3.6.pre/lib,/usr/lib/ruby/gems/1.8/gems/mime-types-1.16/lib,/usr/lib/ruby/gems/1.8/gems/net-sftp-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/net-ssh-2.0.15/lib,/usr/lib/ruby/gems/1.8/gems/rake-0.8.7/lib,/usr/lib/ruby/gems/1.8/gems/rest-client-1.5.1/lib,/usr/lib/ruby/gems/1.8/gems/rjb-1.1.9/lib,/usr/lib/ruby/gems/1.8/gems/rspec-1.2.8/lib,/usr/lib/ruby/gems/1.8/gems/rubyforge-1.0.5/lib,/usr/lib/ruby/gems/1.8/gems/rubygems-update-1.3.6/hide_lib_for_update,/usr/lib/ruby/gems/1.8/gems/rubyzip-0.9.1/lib,/usr/lib/ruby/gems/1.8/gems/xml-simple-1.0.12/lib
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'eruby'
setlocal syntax=eruby
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 13 - ((12 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 08l
wincmd w
argglobal
edit ~/src/ftw/app/views/layouts/application.html.erb
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=(0
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=:#
setlocal commentstring=<%#%s%>
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'eruby'
setlocal filetype=eruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetErubyIndent()
setlocal indentkeys=o,O,*<Return>,<>>,{,},0),0],o,O,!^F,=end,=else,=elsif,=rescue,=ensure,=when
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,/usr/lib/ruby/site_ruby/1.8,/usr/lib64/ruby/site_ruby/1.8,/usr/lib64/ruby/site_ruby/1.8/x86_64-linux,/usr/lib/ruby/site_ruby,/usr/lib64/ruby/site_ruby,/usr/lib64/site_ruby/1.8,/usr/lib64/site_ruby/1.8/x86_64-linux,/usr/lib64/site_ruby,/usr/lib/ruby/1.8,/usr/lib64/ruby/1.8,/usr/lib64/ruby/1.8/x86_64-linux,,~/.gem/ruby/1.8/gems/Antwrap-0.7.0/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.5/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.5/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.5/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.5/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.5/lib,~/.gem/ruby/1.8/gems/archive-tar-minitar-0.5.2/lib,~/.gem/ruby/1.8/gems/builder-2.1.2/lib,~/.gem/ruby/1.8/gems/buildr-1.3.3/lib,~/.gem/ruby/1.8/gems/highline-1.4.0/lib,~/.gem/ruby/1.8/gems/hoe-1.7.0/lib,~/.gem/ruby/1.8/gems/net-sftp-2.0.1/lib,~/.gem/ruby/1.8/gems/net-ssh-2.0.4/lib,~/.gem/ruby/1.8/gems/rack-1.0.1/lib,~/.gem/ruby/1.8/gems/rails-2.3.5/lib,~/.gem/ruby/1.8/gems/rake-0.8.1/lib,~/.gem/ruby/1.8/gems/rjb-1.1.6/lib,~/.gem/ruby/1.8/gems/rspec-1.1.5/lib,~/.gem/ruby/1.8/gems/rubyforge-1.0.0/lib,~/.gem/ruby/1.8/gems/rubyzip-0.9.1/lib,~/.gem/ruby/1.8/gems/webgen-0.5.7/lib,~/.gem/ruby/1.8/gems/xml-simple-1.0.11/lib,/usr/lib/ruby/gems/1.8/gems/Antwrap-0.7.0/lib,/usr/lib/ruby/gems/1.8/gems/archive-tar-minitar-0.5.2/lib,/usr/lib/ruby/gems/1.8/gems/builder-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/buildr-1.3.5/addon,/usr/lib/ruby/gems/1.8/gems/buildr-1.3.5/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.7.3/lib,/usr/lib/ruby/gems/1.8/gems/diff-lcs-1.1.2/lib,/usr/lib/ruby/gems/1.8/gems/gherkin-1.0.30/lib,/usr/lib/ruby/gems/1.8/gems/highline-1.5.1/lib,/usr/lib/ruby/gems/1.8/gems/hoe-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/i18n-0.3.6.pre/lib,/usr/lib/ruby/gems/1.8/gems/mime-types-1.16/lib,/usr/lib/ruby/gems/1.8/gems/net-sftp-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/net-ssh-2.0.15/lib,/usr/lib/ruby/gems/1.8/gems/rake-0.8.7/lib,/usr/lib/ruby/gems/1.8/gems/rest-client-1.5.1/lib,/usr/lib/ruby/gems/1.8/gems/rjb-1.1.9/lib,/usr/lib/ruby/gems/1.8/gems/rspec-1.2.8/lib,/usr/lib/ruby/gems/1.8/gems/rubyforge-1.0.5/lib,/usr/lib/ruby/gems/1.8/gems/rubygems-update-1.3.6/hide_lib_for_update,/usr/lib/ruby/gems/1.8/gems/rubyzip-0.9.1/lib,/usr/lib/ruby/gems/1.8/gems/xml-simple-1.0.12/lib
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'eruby'
setlocal syntax=eruby
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 13 - ((12 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 08l
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 103 + 103) / 207)
exe 'vert 2resize ' . ((&columns * 103 + 103) / 207)
tabedit ~/src/ftw/app/views/leagues/show.html.erb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=(0
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=:#
setlocal commentstring=<%#%s%>
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'eruby'
setlocal filetype=eruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetErubyIndent()
setlocal indentkeys=o,O,*<Return>,<>>,{,},0),0],o,O,!^F,=end,=else,=elsif,=rescue,=ensure,=when
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,/usr/lib/ruby/site_ruby/1.8,/usr/lib64/ruby/site_ruby/1.8,/usr/lib64/ruby/site_ruby/1.8/x86_64-linux,/usr/lib/ruby/site_ruby,/usr/lib64/ruby/site_ruby,/usr/lib64/site_ruby/1.8,/usr/lib64/site_ruby/1.8/x86_64-linux,/usr/lib64/site_ruby,/usr/lib/ruby/1.8,/usr/lib64/ruby/1.8,/usr/lib64/ruby/1.8/x86_64-linux,,~/.gem/ruby/1.8/gems/Antwrap-0.7.0/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.5/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.5/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.5/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.5/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.5/lib,~/.gem/ruby/1.8/gems/archive-tar-minitar-0.5.2/lib,~/.gem/ruby/1.8/gems/builder-2.1.2/lib,~/.gem/ruby/1.8/gems/buildr-1.3.3/lib,~/.gem/ruby/1.8/gems/highline-1.4.0/lib,~/.gem/ruby/1.8/gems/hoe-1.7.0/lib,~/.gem/ruby/1.8/gems/net-sftp-2.0.1/lib,~/.gem/ruby/1.8/gems/net-ssh-2.0.4/lib,~/.gem/ruby/1.8/gems/rack-1.0.1/lib,~/.gem/ruby/1.8/gems/rails-2.3.5/lib,~/.gem/ruby/1.8/gems/rake-0.8.1/lib,~/.gem/ruby/1.8/gems/rjb-1.1.6/lib,~/.gem/ruby/1.8/gems/rspec-1.1.5/lib,~/.gem/ruby/1.8/gems/rubyforge-1.0.0/lib,~/.gem/ruby/1.8/gems/rubyzip-0.9.1/lib,~/.gem/ruby/1.8/gems/webgen-0.5.7/lib,~/.gem/ruby/1.8/gems/xml-simple-1.0.11/lib,/usr/lib/ruby/gems/1.8/gems/Antwrap-0.7.0/lib,/usr/lib/ruby/gems/1.8/gems/archive-tar-minitar-0.5.2/lib,/usr/lib/ruby/gems/1.8/gems/builder-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/buildr-1.3.5/addon,/usr/lib/ruby/gems/1.8/gems/buildr-1.3.5/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.7.3/lib,/usr/lib/ruby/gems/1.8/gems/diff-lcs-1.1.2/lib,/usr/lib/ruby/gems/1.8/gems/gherkin-1.0.30/lib,/usr/lib/ruby/gems/1.8/gems/highline-1.5.1/lib,/usr/lib/ruby/gems/1.8/gems/hoe-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/i18n-0.3.6.pre/lib,/usr/lib/ruby/gems/1.8/gems/mime-types-1.16/lib,/usr/lib/ruby/gems/1.8/gems/net-sftp-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/net-ssh-2.0.15/lib,/usr/lib/ruby/gems/1.8/gems/rake-0.8.7/lib,/usr/lib/ruby/gems/1.8/gems/rest-client-1.5.1/lib,/usr/lib/ruby/gems/1.8/gems/rjb-1.1.9/lib,/usr/lib/ruby/gems/1.8/gems/rspec-1.2.8/lib,/usr/lib/ruby/gems/1.8/gems/rubyforge-1.0.5/lib,/usr/lib/ruby/gems/1.8/gems/rubygems-update-1.3.6/hide_lib_for_update,/usr/lib/ruby/gems/1.8/gems/rubyzip-0.9.1/lib,/usr/lib/ruby/gems/1.8/gems/xml-simple-1.0.12/lib
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'eruby'
setlocal syntax=eruby
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 20 - ((19 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
20
normal! 018l
2wincmd w
tabedit ~/src/ftw/app/models/league.rb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=(0
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetRubyIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,/usr/lib/ruby/site_ruby/1.8,/usr/lib64/ruby/site_ruby/1.8,/usr/lib64/ruby/site_ruby/1.8/x86_64-linux,/usr/lib/ruby/site_ruby,/usr/lib64/ruby/site_ruby,/usr/lib64/site_ruby/1.8,/usr/lib64/site_ruby/1.8/x86_64-linux,/usr/lib64/site_ruby,/usr/lib/ruby/1.8,/usr/lib64/ruby/1.8,/usr/lib64/ruby/1.8/x86_64-linux,,~/.gem/ruby/1.8/gems/Antwrap-0.7.0/lib,~/.gem/ruby/1.8/gems/actionmailer-2.3.5/lib,~/.gem/ruby/1.8/gems/actionpack-2.3.5/lib,~/.gem/ruby/1.8/gems/activerecord-2.3.5/lib,~/.gem/ruby/1.8/gems/activeresource-2.3.5/lib,~/.gem/ruby/1.8/gems/activesupport-2.3.5/lib,~/.gem/ruby/1.8/gems/archive-tar-minitar-0.5.2/lib,~/.gem/ruby/1.8/gems/builder-2.1.2/lib,~/.gem/ruby/1.8/gems/buildr-1.3.3/lib,~/.gem/ruby/1.8/gems/highline-1.4.0/lib,~/.gem/ruby/1.8/gems/hoe-1.7.0/lib,~/.gem/ruby/1.8/gems/net-sftp-2.0.1/lib,~/.gem/ruby/1.8/gems/net-ssh-2.0.4/lib,~/.gem/ruby/1.8/gems/rack-1.0.1/lib,~/.gem/ruby/1.8/gems/rails-2.3.5/lib,~/.gem/ruby/1.8/gems/rake-0.8.1/lib,~/.gem/ruby/1.8/gems/rjb-1.1.6/lib,~/.gem/ruby/1.8/gems/rspec-1.1.5/lib,~/.gem/ruby/1.8/gems/rubyforge-1.0.0/lib,~/.gem/ruby/1.8/gems/rubyzip-0.9.1/lib,~/.gem/ruby/1.8/gems/webgen-0.5.7/lib,~/.gem/ruby/1.8/gems/xml-simple-1.0.11/lib,/usr/lib/ruby/gems/1.8/gems/Antwrap-0.7.0/lib,/usr/lib/ruby/gems/1.8/gems/archive-tar-minitar-0.5.2/lib,/usr/lib/ruby/gems/1.8/gems/builder-2.1.2/lib,/usr/lib/ruby/gems/1.8/gems/buildr-1.3.5/addon,/usr/lib/ruby/gems/1.8/gems/buildr-1.3.5/lib,/usr/lib/ruby/gems/1.8/gems/cucumber-0.7.3/lib,/usr/lib/ruby/gems/1.8/gems/diff-lcs-1.1.2/lib,/usr/lib/ruby/gems/1.8/gems/gherkin-1.0.30/lib,/usr/lib/ruby/gems/1.8/gems/highline-1.5.1/lib,/usr/lib/ruby/gems/1.8/gems/hoe-2.3.3/lib,/usr/lib/ruby/gems/1.8/gems/i18n-0.3.6.pre/lib,/usr/lib/ruby/gems/1.8/gems/mime-types-1.16/lib,/usr/lib/ruby/gems/1.8/gems/net-sftp-2.0.2/lib,/usr/lib/ruby/gems/1.8/gems/net-ssh-2.0.15/lib,/usr/lib/ruby/gems/1.8/gems/rake-0.8.7/lib,/usr/lib/ruby/gems/1.8/gems/rest-client-1.5.1/lib,/usr/lib/ruby/gems/1.8/gems/rjb-1.1.9/lib,/usr/lib/ruby/gems/1.8/gems/rspec-1.2.8/lib,/usr/lib/ruby/gems/1.8/gems/rubyforge-1.0.5/lib,/usr/lib/ruby/gems/1.8/gems/rubygems-update-1.3.6/hide_lib_for_update,/usr/lib/ruby/gems/1.8/gems/rubyzip-0.9.1/lib,/usr/lib/ruby/gems/1.8/gems/xml-simple-1.0.12/lib
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 3 - ((2 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 0
2wincmd w
tabnext 2
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
