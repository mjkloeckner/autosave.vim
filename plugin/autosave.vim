" default filetypes
if !exists('g:auto_save_filetypes')
	let g:auto_save_filetypes = [ 'markdown', 'text' ]
endif

if !exists('g:auto_save_all_filetypes')
	let g:auto_save_all_filetypes = 0
endif

let s:auto_save_filetype_enabled = 0
let s:auto_save_write = 0

function s:auto_save()
	if s:auto_save_filetype_enabled == 1 || g:auto_save_all_filetypes == 1
		if s:auto_save_write == 1
			let s:auto_save_write = 0
			if &modified
				let l:bytes = line2byte('$') + len(getline('$'))
				let l:newfile = filereadable(expand('%:p')) ? "" : "[New] "
				silent! write
				echo "\"" .. expand('%') .. "\" " .. l:newfile .. line('$')
							\.. "L, " .. l:bytes .. "B written [autosave]"
			endif
		endif
	endif
endfunction

function s:autosave_current_buffer_enable()
	let s:auto_save_filetype_enabled = 1
	au TextChanged,TextChangedI <buffer> silent! let s:auto_save_write = 1
	au CursorHold,CursorHoldI <buffer> call s:auto_save()
endfunction

if g:auto_save_all_filetypes == 0
	au BufEnter,FileType * if index(g:auto_save_filetypes, &filetype) !=# -1 |
				\ call s:autosave_current_buffer_enable() | endif
else
	au BufEnter,FileType * call s:autosave_current_buffer_enable()
endif
