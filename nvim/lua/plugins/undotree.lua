return {
    {
    "mbbill/undotree",
    lazy = false,
    priority = 1000,
    config = function()
         vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
    },
}
