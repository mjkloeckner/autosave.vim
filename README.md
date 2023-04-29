# vim autosave

This is a plugin to auto save the current buffer (if modified) when the cursor
is idle.

## Installing

If you are using [vim-plug](https://github.com/junegunn/vim-plug) add this to
your plugins list:

```vim
Plug 'chrisbra/Colorizer'
```

## Options

- Enable auto_save for only these filetypes, to see all posible filetypes 
  see: <https://vi.stackexchange.com/questions/5780/list-known-filetypes>

  ```vim
  let g:auto_save_file_types = [ 'markdown' ]
  ```

- Enable auto_save for all filetypes
  ```vim
  let g:auto_save_all_filetypes = 0
  ```


## License

[MIT](https://opensource.org/licenses/MIT)
