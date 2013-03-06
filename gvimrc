if has ("gui_macvim")
    set fuoptions=maxvert,maxhorz
    set guifont=PragmataPro:h13
    set transparency=15
elseif has("gui_win32")
    set guifont=Consolas:h10
end

set antialias
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=T
set encoding=utf-8
