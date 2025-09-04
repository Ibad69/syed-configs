return {
  "ej-shafran/compile-mode.nvim",
  version = "^5.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {
      -- Force output window to split below
      split = function()
        vim.cmd("botright split")
        vim.cmd("resize 10")
        return vim.api.nvim_get_current_win()
      end,

      -- Optional: Enable ANSI colors in output
      -- baleia_setup = true,
    }
  end,
}

