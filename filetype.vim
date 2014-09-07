if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect

    " Ignore filetypes for *.fs files
    autocmd! BufNewFile,BufRead *.fs  setfiletype ignored

augroup END
