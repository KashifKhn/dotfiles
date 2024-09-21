local opts = {
  signs = {
    add = { hl = "GitGutterAdd", text = "▋" },
    change = { hl = "GitGutterChange", text = "▋" },
    delete = { hl = "GitGutterDelete", text = "▋" },
    topdelete = { hl = "GitGutterDelete", text = "▔" },
    changedelete = { hl = "GitGutterChange", text = "▎" },
  },
  keymaps = {
    noremap = true,
    buffer = true,
    ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
    ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },
    ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
  },
  watch_index = {
    interval = 1000,
  },
  sign_priority = 6,
  status_formatter = nil,
  update_debounce = 100,
  use_decoration_api = true,
  use_internal_diff = true,
}

return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
    end,
  },
}
