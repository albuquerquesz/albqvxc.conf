return {
  {
    "folke/snacks.nvim",
    config = function(_, opts)
      opts.explorer = vim.tbl_deep_extend("force", {
        hidden = true,
        ignored = true,
      }, opts.explorer or {})

      local function setup_dashboard_highlights()
        vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { link = "Title" })
        vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { link = "Comment" })
        vim.api.nvim_set_hl(0, "SnacksDashboardKey", { link = "Keyword" })
        vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { link = "Normal" })
      end

      -- Set up highlights initially
      setup_dashboard_highlights()

      -- Re-apply highlights when colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = setup_dashboard_highlights,
      })

      local snacks = require("snacks")
      snacks.setup(opts)

      local function open_explorer(opt)
        opt = vim.tbl_deep_extend("force", {
          hidden = true,
          ignored = true,
          git_status = true,
          git_untracked = true,
        }, opt or {})
        snacks.explorer(opt)
      end

      vim.keymap.set("n", "<leader>fe", function()
        open_explorer({ cwd = LazyVim.root() })
      end, { desc = "Explorer Snacks (root dir)" })

      vim.keymap.set("n", "<leader>fE", function()
        open_explorer()
      end, { desc = "Explorer Snacks (cwd)" })

      vim.keymap.set("n", "<leader>e", function()
        open_explorer({ cwd = LazyVim.root() })
      end, { desc = "Explorer" })

      vim.keymap.set("n", "<leader>E", function()
        open_explorer()
      end, { desc = "Explorer (cwd)" })
    end,
    opts = {
      indent = { enabled = false },
      dashboard = {
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = true },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
        sections = {
          {
            text = [[
██╗     ███████╗ ██╗  ██╗ ███████╗  █████╗ 
██║     ██╔════╝ ╚██╗██╔╝ ██╔════╝ ██╔══██╗
██║     █████╗    ╚███╔╝  ███████╗ ███████║
██║     ██╔══╝    ██╔██╗  ╚════██║ ██╔══██║
███████╗███████╗ ██╔╝ ██╗ ███████║ ██║  ██║
╚══════╝╚══════╝ ╚═╝  ╚═╝ ╚══════╝ ╚═╝  ╚═╝]],
            align = "center",
            padding = 1,
            hl = "SnacksDashboardHeader",
          },
          {
            text = "Bom dia, magnata! Qual a boa pra hoje?",
            align = "center",
            padding = 1,
            hl = "SnacksDashboardDesc",
          },
          { section = "keys", gap = 1, padding = 1 },
        },
      },
    },
  },
}
