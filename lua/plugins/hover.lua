local util = vim.lsp.util
local separator = "\n---\n"
local name = "LSP With Diagnostic"

local LSPWithDiagSource = {
  name = name,
  priority = 1000,
  enabled = function()
    return true
  end,
  execute = function(opts, done)
    local params = util.make_position_params()
    vim.lsp.buf_request_all(0, "textDocument/hover", params, function(responses)
      local value = ""
      for _, response in pairs(responses) do
        local result = response.result
        if result and result.contents and result.contents.value then
          value = value .. separator .. result.contents.value
        end
      end

      local _, row = unpack(vim.fn.getpos("."))
      local lineDiag = vim.diagnostic.get(0, { lnum = row - 1 })
      for _, d in pairs(lineDiag) do
        if d.message then
          local formattedSource = d.source:sub(-1) == "." and d.source:sub(1, -2) .. ":" or d.source
          value = value .. separator .. string.format("*%s* %s", formattedSource, d.message)
        end
      end
      value = value:gsub("\r", "")

      if value ~= "" then
        done({ lines = vim.split(value, "\n", { trimempty = true }), filetype = "markdown" })
      else
        done()
      end
    end)
  end,
}

return {
  "lewis6991/hover.nvim",
  config = function()
    local hover = require("hover")

    hover.setup({
      init = function()
        hover.register(LSPWithDiagSource)
        -- select api to use to display the hover
        require("hover.providers.gh")
      end,
      preview_opts = {
        border = "rounded",
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = false,
      title = true,
    })

    vim.keymap.set("n", "gh", hover.hover, { desc = name })
  end,
}
