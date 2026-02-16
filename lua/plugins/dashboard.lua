return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local button = opts.section.buttons

      button.val = {
        button("f", "  Find File", "<cmd>Telescope find_files<cr>"),
        button("n", "  New File", "<cmd>ene<cr>"),
        button("c", "  Config", "<cmd>cd ~/.config/nvim | Telescope find_files<cr>"),
        button("q", "  Quit", "<cmd>qa<cr>"),
      }

      return opts
    end,
  },
}
