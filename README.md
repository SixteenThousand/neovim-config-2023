### Notice: this config is no longer in use!

It seems my neovim installation has become laughably out of date, to the point
where even my package manager is deprecated. Hence I have decided to reinstall
neovim (using a package manager this time!) and rewrite my config from scratch
(although most of it will likely be copy-pasted from this repo).
You can find the new config 
![here](https://github.com/SixteenThousand/neovim-config-2024).

# My Neovim Configuration

Just my (fairly lightweight) configuration for the neovim, the
highly-extensible, terminal based code editor.

## Interesting features
- A session manager
- A colour scheme picker
- Way too many remaps


## Planned Changes
 - Add LSP support (started with some success!)
 - Add autoformatting (most likely using Prettier, or just existing vim tools)
to automatically narrow text to be 80 characters wide
 - Make splits open vertically by default
 - Make terminal windows (see `terminal_stuff.lua`) be more narrow by default
 - Stop the session manager throwing window-id errors (on hiatus; looks like the
 APIs my pop-ups are based on is quite unstable)
 - Integrate quickfix list into my workflow (will likely require new remaps)
 - Make Fern show hidden items by default
 - Make function that automatically opens a relevant REPL
 - Make telescope picker to look through files of a project or just the files in
 the current buffer's main directory
