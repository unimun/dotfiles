return {
  "folke/snacks.nvim",
  keys = {
    {
      "<leader>`",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
    },
  },
}
