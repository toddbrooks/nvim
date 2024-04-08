local mapkey = require("util.keymapper").mapkey

return {
  "voldikss/vim-floaterm",
  lazy = false,
  --
  config = function()
    -- set keybinds
    mapkey("<Esc>", "FloatermHide!", "t", { noremap = true, silent = true })
    mapkey("<s-Esc>", "FloatermKill!", "t", { noremap = true, silent = true })
    mapkey("<leader>tt", "FloatermToggle", "n", { noremap = false, silent = true })
  end,
}
