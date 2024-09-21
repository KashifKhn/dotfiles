local opts = {
  float_diff = true, -- using float window previews diff, set this `true` will disable layout option
  layout = "left_bottom", -- "left_bottom", "left_left_bottom"
  position = "left", -- "right", "bottom"
  ignore_filetype = { "undotree", "undotreeDiff", "qf", "TelescopePrompt", "spectre_panel", "tsplayground" },
  window = {
    winblend = 30,
  },
  keymaps = {
    ["j"] = "move_next",
    ["k"] = "move_prev",
    ["gj"] = "move2parent",
    ["J"] = "move_change_next",
    ["K"] = "move_change_prev",
    ["<cr>"] = "action_enter",
    ["p"] = "enter_diffbuf",
    ["q"] = "quit",
  },
}

return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("undotree").setup(opts)
  end,
}
