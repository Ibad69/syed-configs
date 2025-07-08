return {{
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "storm", -- options: "storm", "night", "moon", "day"
            transparent = true,
            terminal_colors = true,
        })
        vim.cmd([[colorscheme tokyonight]])
    end,
}
}

-- return {
--   {
--     "folke/tokyonight.nvim",
--     lazy = false, -- Load during startup
--     priority = 1000, -- Load before other plugins
--     opts = {
--       style = "night", -- Your preferred style
--       transparent = true, -- Enable transparent background
--       styles = {
--         sidebars = "transparent", -- Transparent sidebars (e.g., file explorer)
--         floats = "transparent", -- Transparent floating windows
--       },
--     },
--     config = function()
--       vim.cmd([[colorscheme tokyonight]]) -- Load the colorscheme
--       -- Remove explicit background settings to ensure transparency
--       vim.api.nvim_set_hl(0, "Normal", { bg = nil }) -- Clear Normal background
--       vim.api.nvim_set_hl(0, "NormalFloat", { bg = nil }) -- Clear float background
--       vim.api.nvim_set_hl(0, "SignColumn", { bg = nil }) -- Clear sign column background
--       vim.api.nvim_set_hl(0, "LineNr", { bg = nil }) -- Clear line number background
--     end,
--   },
-- }
-- return {
--     {
--         "catppuccin/nvim",
--         name = "catppuccin",
--         lazy = false,
--         priority = 1000,
--         opts = { transparent_background = true },
--         config = function()
--             vim.cmd([[colorscheme catppuccin]])
--         end,
--     }
-- }
--
-- return {
--     {
--         "catppuccin/nvim",
--         name = "catppuccin",
--         lazy = false,
--         priority = 1000,
--         config = function()
--             require("catppuccin").setup({
--                 transparent_background = true,
--             })
--             vim.cmd([[colorscheme catppuccin]])
--         end,
--     }
-- }

