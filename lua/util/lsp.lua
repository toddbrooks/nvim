local mapkey = require("util.keymapper").mapkey

local M = {}

-- enable keybinds only for when lsp server is available
M.on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = false, silent = true, buffer = bufnr }

	-- set keybinds
	mapkey("gf", "Lspsaga lsp_finder", "n", opts)
	mapkey("gD", "Lspsaga goto_definition", "n", opts)
	mapkey("gd", "Lspsaga peek_definition", "n", opts)
	mapkey("gi", "Lspsaga goto_implementation", "n", opts)
	mapkey("K", "Lspsaga hover_doc", "n", opts)

	mapkey("<leader>ca", "Lspsaga code_action", "n", opts)
	mapkey("<leader>rn", "Lspsaga rename", "n", opts)
	mapkey("<leader>D", "Lspsaga show_line_diagnostics", "n", opts)
	mapkey("<leader>d", "Lspsaga show_cursor_diagnostics", "n", opts)
	mapkey("<leader>pd", "Lspsaga diagnostic_jump_prev", "n", opts)
	mapkey("<leader>nd", "Lspsaga diagnostic_jump_next", "n", opts)
	mapkey("<leader>lo", "LSoutlineTogg", "n", opts)

	-- typescript specific keymaps
	if client.name == "typescript" then
		-- organization imports
		mapkey("<leader>oi", "TypeScriptOrganizeImports", "n", opts)
	end
end

M.typescript_organise_imports = {
	description = "Organise Imports",
	function()
		local params = {
			command = "_typescript.organizeImports",
			arguments = { vim.fn.expand("%:p") },
		}
		-- reorganise imports
		vim.lsp.buf.execute_command(params)
	end,
}

return M
