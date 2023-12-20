# My Neovim Config

Just my (fairly lightwieght) configuration for the neovim, the
highly-extensible, terminal based code editor.

## Interesting features
- A session manager I wrote myself
- A colour scheme picker I wrote myself
- Way too many remaps


## Planned Changes
 - Add LSP support
 - Fix issue with Drex and loading of session files (now partially fixed;
	this is not an issue now, however the solution is quite hacky and probably
	quite fragile)
 - Alternative to above: investigate Fern as another file explorer option
 - Add autoformatting (most likely using Prettier, or just existing vim tools)
	to automatically narrow text to be 80 characters wide
 - Make splits open vertically by default
 - Add a variant of the "Save session and Quit Nvim" menu which just saves a
 session without quitting
 - Make terminal windows (see `terminal_stuff.lua`) be more narrow by default
 - stop the session manager throwing window-id errors (low priority, does not
	affect functionality)
