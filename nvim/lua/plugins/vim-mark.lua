return {
  "inkarkat/vim-mark",
  dependencies = { "inkarkat/vim-ingo-library" },
  opts = { mw_no_mappings = 1 },
  keys = { { "<leader>mm", "<Plug>MarkSet", desc = "Set Mark" } },
}
