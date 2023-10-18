local popup = require "plenary.popup"

-- (array of strings) opt_names: list of the options to be displayed in the popup
-- (function) actions: function the called when an option is chosen by the user
-- 		note that actions receives two arguments: the window id (maybe??? it's 
-- 		useless anyway) and the option name chosen

function my_menu(opt_names,actions)
	window = popup.create(opt_names,{
		title = "My Menu",
		border = true,
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		callback = actions,
	})
end
