# Neovim Configuration

Personal notes on what goes on in this Neovim configuration. Mostly used
to keep track of the different keymaps that have been defined.

## Configuration

Keep track of configuration through the "config" LUA namespace.

`init.lua` -> includes -> `config/*.lua`

### Structure

autocmds.lua - custom autocommands
colors.lua - pretty colours
highlights.lua - custom highighting
keymaps.lua - customs keymaps
lazy.lua - bootstrap plugin manager
options.lua - personal options1
filetypes.lua - special config for filetypes


## Keymap Cheatsheet

`C-/` - Comment line / visual block


## TODO

- [ ] Port existing vimrc to LUA
- [ ] Configure Lazy

