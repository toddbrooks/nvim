-- Set global variables
vim.g.mapleader = " "

-- Set vim options
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.o.mouse = "a"

-- Set keymaps
vim.api.nvim_set_keymap("n", "<leader>", "<Plug>(easymotion-bd-jk)", { noremap = true })
vim.keymap.set("i", "kj", "<esc>", { silent = true })  -- sets noremap automatically

-- Function to toggle syntax.
vim.api.nvim_set_var("toggle_syntax_state", true)

SyntaxToggle = function()
    local gvar = "toggle_syntax_state"
    local syntax = vim.api.nvim_get_var(gvar)
    if syntax == true then
        vim.cmd("syntax off")
        vim.api.nvim_set_var(gvar, false)
    else
        vim.cmd(":syntax on")
        vim.api.nvim_set_var(gvar, true)
    end
end

vim.keymap.set("n", "<Leader>s", SyntaxToggle, { silent = true, desc = "Toggle syntax" })
