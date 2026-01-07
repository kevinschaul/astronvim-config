-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        width = 40,
        preset = {
          header = "yo",
        },
      },
      image = { enabled = false },
      picker = {
        formatters = {
          file = {
            filename_first = true,
            truncate = 80,
          },
        },
      },
    },
  },

  {
    "jmbuhr/otter.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },

  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("typescript", { "javascript" })
      luasnip.filetype_extend("typescriptreact", { "javascript" })
    end,
  },

  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        -- status.component.mode(),
        -- status.component.git_branch(),
        status.component.file_info { filename = { modify = ":." }, filetype = false },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        -- status.component.virtual_env(),
        status.component.treesitter(),
        status.component.nav(),
        -- status.component.mode { surround = { separator = "right" } },
      }
    end,
  },
}
