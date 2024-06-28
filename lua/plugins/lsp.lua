return {
  {
    "neoclide/coc.nvim",
    branch = "release",
  },
  {
    "hrsh7th/nvim-cmp",
    init = function()
      local cmp = require("cmp")
      -- `/` cmdline setup.
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
    end,
  },
}
