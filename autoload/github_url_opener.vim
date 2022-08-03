" SERVICE FUNCTIONS {{{

function! github_url_opener#open(url) abort
  const prev_shell = &shell
  set shell=cmd

  silent exec '! start chrome "' .. a:url .. '"'

  let &shell = prev_shell
endfunction

function! github_url_opener#github_url(repo) abort
  const regexp = '[^/A-Za-z0-9_.-]'
  const parsed_repo = trim(substitute(a:repo, regexp, '', 'g'))

  return 'https://github.com/' .. parsed_repo
endfunction

" }}}

" COMMAND FUNCTIONS {{{

function! github_url_opener#github_url_cursor() abort
  const expanded = expand('<cWORD>')
  const url = github_url_opener#github_url(expanded)

  call github_url_opener#open(url)
endfunction

function! github_url_opener#github_url_open(repo) abort
  const url = github_url_opener#github_url(a:repo)

  call github_url_opener#open(url)
endfunction

" }}}
