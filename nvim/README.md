# Neovim Configuration

Personal notes on what goes on in this Neovim configuration. Mostly used
to keep track of the different keymaps that have been defined.

## Requirements

My configuration has been built against Neovim 0.11.x. This should be fine when
installing with `brew` on MacOS or distribution provided packages on Fedora.
The latest Debian (13, Trixie) however still installs an older Neovim, and on
those systems it's probably best to download the release and wire it into the
system.

My preference is to place the distribution into `/usr/local` in it's own named
directory, i.e., `/usr/local/nvim-linux-arm64`, then link the executable into
`/usr/local/bin` for system-wide access.

## Structure

Keep track of configuration through the "user" LUA namespace.

`init.lua` -> requires -> `user`

`lua/user/init.lua` is sourced in this way, and the custom user configuration
is actually contained there.

`lua/user/init.lua` then includes individual lua files for specific
configurations:

- `lazy.lua` - instatiates the Lazy plugin manager, and provides it's
  configuration. Plugins are loaded by walking through the `lua/user/plugins`
  directory. Except for the common plugins, each plugin is specified in it's own
  file, and configured seperately to maintain some (my) sanity.

- `options.lua` - contains all the custom vim/nvim configuration options.

- `lsp.lua` - groups all of my LSP configuration together in one place. _This
  probably still needs some work to see if we can remove the need to define
  configuration for the LSP in `nvim/lsp/<lsp_name>` directory._

- `appearance.lua` - groups all appearance (colour) configuration together in
  one place.

- `functions.lua` - where all my custom functions are defined.

- `autocmds.lua` - where Vim auto commands are defined.

- `keymaps.lua` - where all custom keymaps are defined.

There are also customisations in `nvim/after/ftplugin` that tweaks options
specifically for certain file types.

## LSP

The common blueprint is to add `mason.nvim` and `mason-lspconfig.nvim` to kind
of "automagically" install and wire up LSP to Neovim. This is great, but it
feels a bit klunky, and the Neovim team have done some really good work to
internalise this in Neovim 0.11.x. It also obfuscates a lot of the detail away
from the user, and makes us lazy in respect to understanding what the hell the
configuration is actually doing.

The new mechanism feels like it also puts some control back into user hands,
and simplifies wiring in custom LSP's into Neovim. To this end I'm also
choosing to manage the installation of LSP server myself as opposed to using
Mason to install the LSP. Nothing against Mason, it's great, but again I feel
it makes us lazy, and overly complicates the process of adding a custom LSP
such as for example the Apache Camel LSP.

Pretty much all the details of adding an LSP can be gleaned from the `help
lspconfig-all` Neovim help.

Again, you could use the distribution's bundled packages to install many of
these LSP servers. I like to keep them seperate from the distribution in my
home directory. LSP's are placed in `~/opt/<lsp_name>` and the executable
linked into `~/.local/bin`.

## Keymap Cheatsheet

### General Editing and Navigation

- `C-/` - Comment line / visual block
- `[b` and `]b` or `[B` and `]B` | Normal mode, navigate through the buffer list
- `[a` and `]a` or `[A` and `]A` | Normal mode, navigate through the argument list
- `[<Space>` and `]<Space>` | Normal mode, add an empty line above/below the cursor

### LSP/Code Actions and Diagnostics

- `grn` | Normal mode, renames the item/variable and updates all references to
  it.
- `grr` | Normal mode, opens a list of all references to the value.
- `gri` | Normal mode, opens the implementation of the item.
- `gra` | Normal/Visual mode, perform a code action.
- `CTRL-S` | Insert/Select mode, opens signature help.
- `[d` and `]d` | move between diagnostics in the current buffer.
- `[D` and `]D` | jumps to first/last diagnostic.
- `[q` and `]q` or `[Q` and `]Q` | navigate through the quickfix list
- `[l` and `]l` or `[L` and `]L` | navigate through the location list
- `[t` and `]t` or `[T` and `]T` | navigate through the tag matchlist
- `<leader>dt` | Normal mode, toggle diagnostic messages
- `K` | Visual mode, move selected line up
- `J` | Visual mode, move selected line down
- `<leader>fr` | Normal mode, find the word under the cursos and replace with
  input

### Plugins

#### tpope/vim-surround

- `cs"'` | Normal mode, Surround `"Hello world!"` -> `'Hello world!'`
- `cs'<q>` | Normal mode, Surround `'Hello world!'` -> `<q>Hello world!</q>`
- `cst"` | Normal mode, Remove tags from `<q>Hello world!</q>`
  -> `"Hello world!"`
- `ds"` | Normal mode, Remove `"` delimiters entirely -> `Hello world!`
- `ysiw]` | Normal mode, Surround word with `[]` -> `[Hello] world!`
  (iw is a text object)
- `cs]{` | Normal mode, Surround word with brace -> `{ Hello } world!` (use `}`
  for spaced surround.
- `yssb` or `yss)` | Normal mode, Surround the entire line with parentheses
  -> `({ Hello } world!)
- `ds{` | Normal mode, Remove `{}` brace surround.
- `ds)` | Normal mode, Remove `()` parentheses surround.
- `ysiw<tag>` | Normal mode, Surround word with `<tag>`
- `S<tag>` | (V)isual mode, place selections between `<tag>`

## TODO

### Plugins

- comment
- vim-tmux-navigator
- nvim-autopairs??
- markdown ftplugin
- completion
- nvim-colorizer - configure only for specific file types
