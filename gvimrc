if has ("gui_macvim")
    set fuoptions=maxvert,maxhorz
    set guifont=Menlo:h10
    set transparency=15
elseif has ("windows")
    set guifont=Consolas:h09
end

set antialias
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=T
set encoding=utf-8
