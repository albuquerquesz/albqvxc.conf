return {
  {
    "forest-nvim/sequoia.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "bjarneo/aether.nvim",
    name = "aether",
    priority = 1000,
    opts = {
      transparent = false,
      colors = {
        -- Monotone shades (base00-base07)
        base00 = "#0c0c0c", -- Default background
        base01 = "#bfac89", -- Lighter background (status bars)
        base02 = "#0c0c0c", -- Selection background
        base03 = "#bfac89", -- Comments, invisibles
        base04 = "#e4bf7c", -- Dark foreground
        base05 = "#f5e8d1", -- Default foreground
        base06 = "#f5e8d1", -- Light foreground
        base07 = "#e4bf7c", -- Light background

        -- Accent colors (base08-base0F)
        base08 = "#d40d09", -- Variables, errors, red
        base09 = "#f6312d", -- Integers, constants, orange
        base0A = "#dd920a", -- Classes, types, yellow
        base0B = "#969408", -- Strings, green
        base0C = "#4a8699", -- Support, regex, cyan
        base0D = "#275d7c", -- Functions, keywords, blue
        base0E = "#bb3b74", -- Keywords, storage, magenta
        base0F = "#f6af2e", -- Deprecated, brown/yellow
      },
    },
    config = function(_, opts)
      require("aether").setup(opts)
    end,
  },
  {
    "AbacatePay/vscode-theme",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optional: Configure the theme here if needed
      -- require("abacatepay-theme").setup({})
    end,
  },
  {
    "Shatur/neovim-ayu",
    config = function()
      require("ayu").setup({
        mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
        terminal = true, -- Set to `false` to let terminal manage its own colors.
        overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
      })
    end,
  },
  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    --end
  },
  {
    "getomni/neovim",
  },
  {
    "wesleimp/min-theme.nvim",
    lazy = false,
    priority = 1000, -- load this before other plugins
  },
  {
    "neanias/everforest-nvim",
    opts = {
      colorscheme = "everforest",
      variant = "dark",
    },
    config = function()
      require("lazy").setup({
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      colorscheme = "tokyonight",
      variant = "storm",
    },
    config = function()
      vim.cmd("colorscheme tokyonight-storm")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function() end,
    opts = ...,
  },
  {
    { "shaunsingh/nord.nvim" },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "rose-pine",
      },
    },
  },
  {
    "everviolet/nvim",
    name = "evergarden",
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      theme = {
        variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
        accent = "green",
      },
      editor = {
        transparent_background = false,
        sign = { color = "none" },
        float = {
          color = "mantle",
          solid_border = false,
        },
        completion = {
          color = "surface0",
        },
      },
    },
  },
  {
    "xero/evangelion.nvim",
    lazy = false,
    priority = 0,
  },
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "auto", -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },

        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },

        groups = {
          border = "muted",
          link = "iris",
          panel = "surface",

          error = "love",
          hint = "iris",
          info = "foam",
          note = "pine",
          todo = "rose",
          warn = "gold",

          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          git_dirty = "rose",
          git_ignore = "muted",
          git_merge = "iris",
          git_rename = "pine",
          git_stage = "iris",
          git_text = "rose",
          git_untracked = "subtle",

          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },

        palette = {
          -- Override the builtin palette per variant
          -- moon = {
          --     base = '#18191a',
          --     overlay = '#363738',
          -- },
        },

        -- NOTE: Highlight groups are extended (merged) by default. Disable this
        -- per group via `inherit = false`
        highlight_groups = {
          -- Comment = { fg = "foam" },
          -- StatusLine = { fg = "love", bg = "love", blend = 15 },
          -- VertSplit = { fg = "muted", bg = "muted" },
          -- Visual = { fg = "base", bg = "text", inherit = false },
        },

        before_highlight = function(group, highlight, palette)
          -- Disable all undercurls
          -- if highlight.undercurl then
          --     highlight.undercurl = false
          -- end
          --
          -- Change palette colour
          -- if highlight.fg == palette.pine then
          --     highlight.fg = palette.foam
          -- end
        end,
      })

      -- vim.cmd("colorscheme rose-pine-main")
      -- vim.cmd("colorscheme rose-pine-moon")
      -- vim.cmd("colorscheme rose-pine-dawn")
    end,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = false },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    dependencies = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },
  { "savq/melange-nvim" },
  {
    "datsfilipe/vesper.nvim",
    config = function()
      require("vesper").setup({
        italics = {
          comments = true, -- Boolean: Italicizes comments
          keywords = false, -- Boolean: Italicizes keywords
          transparent = true, -- Boolean: Sets the background to transparent
          functions = false, -- Boolean: Italicizes functions
          strings = false, -- Boolean: Italicizes strings
          variables = false, -- Boolean: Italicizes variables
        },
        overrides = {}, -- A dictionary of group names, can be a function returning a dictionary or a table.
        palette_overrides = {},
      })
    end,
  },
}
