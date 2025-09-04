return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>pf', builtin.git_files, {})
            vim.keymap.set('n', '<C-x>b', builtin.buffers, {})
            vim.keymap.set('n', '<leader>ps', function()
            -- vim.keymap.set('n', '<leader>fp', function()
            -- vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })

	        builtin.grep_string({search = vim.fn.input("Grep > ") });
            end)
        end,
    }
}
