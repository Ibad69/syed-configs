return {
    {"NeogitOrg/neogit",
        lazy = false,
        priority = 1000,
        config = function()
            local neogit = require('neogit')
            neogit.setup {}
        end,}
}
