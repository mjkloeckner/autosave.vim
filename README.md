# vim autosave

This is a plugin to auto save the current buffer (if modified) when the cursor
is idle.

![autosave2](https://user-images.githubusercontent.com/64109770/235279077-886473b6-ce18-49dd-bdda-7687a58fe4eb.gif)

## Installing

If you are using [vim-plug](https://github.com/junegunn/vim-plug) add this to
your plugins list:

```vim
Plug 'mjkloeckner/autosave.vim'
```

## Options

- Enable autosave for only these filetypes

  ```vim
  let g:auto_save_file_types = [ 'markdown' ]
  ```

  To see all posible filetypes see:
  <https://vi.stackexchange.com/questions/5780/list-known-filetypes>

- Enable autosave for all filetypes
  ```vim
  let g:auto_save_all_filetypes = 0
  ```

- The event that triggers the autosave is CursorHold and CursorHoldI (see [:h
  CurosrHold](https://vimdoc.sourceforge.net/htmldoc/autocmd.html#CursorHold)).
  You can change the default wait time to trigger CursorHold with:

  ```vim
  set updatetime = 1000 " set updatetime to 1 s (the default is 4 seconds)
  ```

  Note that a very low value may impact Vim performance.


## License

[MIT](https://opensource.org/licenses/MIT)
