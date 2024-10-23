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
			let l:filename = expand('%') 
			if &modified && l:filename != ""
				let l:bytes = line2byte('$') + len(getline('$'))
				let l:home = expand('$HOME')
				let l:newfile = filereadable(l:filename) ? "" : "[New] "

				if l:filename =~ '^' . l:home
					let l:rel_filename = substitute(l:filename, l:home, '~', '')
				else
					let rel_filename = l:filename
				endif

				silent! write
				echo "\"" .. rel_filename .. "\" " .. l:newfile .. line('$') 
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
