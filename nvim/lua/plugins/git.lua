return {
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gb", ":Git blame<CR>", desc = "Blame" },
      { "<leader>gs", ":Git<CR>", desc = "Status" },
      { "<leader>gw", ":Git show<CR>", desc = "Show" },
      { "<leader>gl", ":Git log --decorate=short<CR>", desc = "Log" },
      { "<leader>gf", ":Git log --decorate=short -p %<CR>", desc = "File log" },
      { "<leader>g1", ":Git log --oneline<CR>", desc = "Log oneline" },
    },
  },
}
