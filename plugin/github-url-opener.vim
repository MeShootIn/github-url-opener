if exists('g:loaded_github_url_opener') | finish | endif
let g:loaded_github_url_opener = v:true

" COMMANDS {{{

" Github Url under Cursor
command! GithubUrlCursor call github_url_opener#github_url_cursor()

" Github Url Open
" TODO -nargs=+
command! -nargs=1 GithubUrlOpen call github_url_opener#github_url_open(
      \ <f-args>
      \ )

" }}}
