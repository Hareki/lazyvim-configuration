local cmp = require("cmp")

return {
  {
    "neoclide/coc.nvim",
    branch = "release",
  },

  --

  {
    "hrsh7th/nvim-cmp",
    event = {
      "InsertEnter",
      "CmdlineEnter",
    },
    dependencies = {
      "hrsh7th/cmp-cmdline",
      -- "dmitmel/cmp-cmdline-history",
    },
    opts = {
      mapping = cmp.mapping.preset.insert({
        ["<A-j>"] = cmp.mapping.select_next_item(),
        ["<A-k>"] = cmp.mapping.select_prev_item(),
      }),
      window = {
        completion = {
          border = "none",
        },
        documentation = {
          border = "none",
        },
      },
    },
    init = function()
      -- `/` cmdline setup.
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
          -- { name = "cmdline_history" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },

  --

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics.virtual_text = false
      opts.inlay_hints.enabled = false
      opts.codelens.enabled = false
    end,
  },
}
