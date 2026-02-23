return {
  {
    "nvim-mini/mini.animate",
    opts = function(_, opts)
      opts.scroll = opts.scroll or {}
      opts.scroll.enable = false
    end,
  },
}
