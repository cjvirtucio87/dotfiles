" Wipe all deleted (unloaded & unlisted) or all unloaded buffers
" see: https://vi.stackexchange.com/a/27105
function! misc#bwipeout(listed) abort
    let l:buffers = filter(getbufinfo(), {_, v -> !v.loaded && (!v.listed || a:listed)})
    if !empty(l:buffers)
        execute 'bwipeout' join(map(l:buffers, {_, v -> v.bufnr}))
    endif
endfunction
