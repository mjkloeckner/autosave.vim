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
				if filereadable(expand('%:p')) == 1
					silent! write
					echo "\"" .. expand('%') .. "\" " .. line('$') .. "L, " ..
								\ l:bytes .. "B written [autosave]"
				else
					silent! write
					echo "\"" .. expand('%') .. "\" [New] " .. line('$') ..
								\"L, " .. l:bytes .. "B written [autosave]"
				endif
			endif
		endif
	endif
endfunction

au TextChanged,TextChangedI <buffer> silent! let s:auto_save_write = 1
au CursorHold,CursorHoldI <buffer> call s:auto_save()

au BufEnter,FileType * if index(g:auto_save_filetypes, &filetype) !=# -1 |
			\ let s:auto_save_filetype_enabled = 1 | endif
