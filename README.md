# My Neovim Config

Just my (fairly lightwieght) configuration for the neovim, the
highly-extensible, terminal based code editor.

## Interesting features
- A session manager I wrote myself
- A colour scheme picker I wrote myself
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
