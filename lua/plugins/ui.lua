return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = false,
        command_palette = false,
      },
      views = {
        cmdline_popup = {
          position = {
            row = 11,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
      },
    },
    {
      "akinsho/bufferline.nvim",
      event = "VeryLazy",
      keys = {
        { "<A-S-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
        { "<A-S-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
        { "<A-S-p>", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      },
    },
    -- use nvim-cmp instead for better autocompletion, currently there's no way to integrate the nvim-cmp suggestions into noice popupmenu
    -- https://github.com/folke/noice.nvim/issues/45
    -- https://github.com/hrsh7th/nvim-cmp/issues/1246
    -- https://github.com/folke/noice.nvim/discussions/241

    -- popupmenu = {
    --   relative = "editor",
    --   position = {
    --     row = 14,
    --     col = "50%",
    --   },
    --   size = {
    --     width = 60,
    --     height = 10,
    --   },
    --   border = {
    --     style = "rounded",
    --     padding = { 0, 1 },
    --   },
    --   win_options = {
    --     winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
    --   },
    -- },
  },
}
