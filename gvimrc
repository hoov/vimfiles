if has ("gui_macvim")
    set fuoptions=maxvert,maxhorz
    set guifont=Menlo:h10
elseif has("gui_win32")
    set guifont=Consolas:h10
end

set antialias
set guioptions-=r
set guioptions-=T
set encoding=utf-8
