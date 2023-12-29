-- ++++++++++++ place for all the LSP configs ++++++++++++

local lspconf = require("lspconfig")
lspconf.pyright.setup{}
lspconf.java_language_server.setup {
	cmd = {"C:/java-language-server/dist/lang_server_windows.cmd"},
	filetypes = {"java"},
}

lspconf.rust_analyzer.setup{
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = false;
			}
		}
	}
}
