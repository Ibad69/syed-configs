vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.g.have_nerd_font = true

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])


vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- pane splits
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>r', ':split<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>h', '<C-W>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>j', '<C-W>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>k', '<C-W>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', '<C-W>l', {noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>q', ':hide<CR>', {noremap = true, silent = true})

-- -- Auto set up dual comment style for C/C++/Java
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "c", "cpp", "java" },
--   callback = function()
--     -- Default: line comments
--     vim.bo.commentstring = "// %s"

--     -- Remap <leader>c in VISUAL mode to use block comments
--     vim.keymap.set("x", "<leader>c", function()
--       local save_cs = vim.bo.commentstring
--       vim.bo.commentstring = "/* %s */"
--       vim.cmd("Commentary")
--       vim.bo.commentstring = save_cs
--     end, { buffer = true, silent = true })
--   end,
-- })

-- comment lines remap
-- disable the o / r / new line comment thingy
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    -- remove flags so `o`, `O`, and <Enter> don't continue comments
    vim.opt_local.formatoptions:remove("r")
    vim.opt_local.formatoptions:remove("o")
  end,
})

vim.api.nvim_set_keymap('n', '<leader>c', ':Commentary<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<leader>c', ':Commentary<CR>', {noremap = true, silent = true})

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
-- my own remap added
--vim.api.nvim_set_keymap('n', '<C-Tab>', '<C-^>', {  silent = true })
--
-- Adding nvim-dap remaps
vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
vim.keymap.set("n", "<leader>ds", [[<cmd> lua require('dap.ui.widgets').sidebar(require('dap.ui.widgets').scopes).open()<CR>]])
vim.keymap.set("n", "<leader>dgt", "<cmd> lua require('dap-go').debug_test()<CR>")
vim.keymap.set("n", "<leader>dgl", "<cmd> lua require('dap-go').debug_last()<CR>")

-- vim terminal commands
--
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', {clear = true}),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Open a terminal at the bottom of the screen with a fixed height.
-- vim.keymap.set("n", ",<leader>t", function()
--   vim.cmd.new()
--   vim.cmd.wincmd "J"
--   vim.api.nvim_win_set_height(0, 12)
--   vim.wo.winfixheight = true
--   vim.cmd.term()
-- end)
--
-- vim.keymap.set("n", "<leader>t", function()
--   vim.cmd.tabnew()
--   vim.cmd.term()
-- end, { desc = "Open terminal in new tab" })

-- vim.keymap.set("n", "<leader>t", function()
--   vim.cmd.new()
--   vim.cmd.wincmd "J"
--   vim.api.nvim_win_set_height(0, 12)
--   vim.wo.winfixheight = true
--   vim.cmd.term()
-- end, { desc = "Open terminal in new tab" })

-- Keep track of a single terminal buffer
local term_buf = nil

vim.keymap.set("n", "<leader>t", function()
  -- If we already created a terminal buffer
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    -- Check if it's visible in a window
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == term_buf then
        vim.api.nvim_set_current_win(win) -- focus it
        return
      end
    end
    -- Not visible? Open it in a bottom split
    vim.cmd.new()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    vim.api.nvim_win_set_buf(0, term_buf)
    return
  end

  -- No terminal yet → create one
  vim.cmd.new()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()

  term_buf = vim.api.nvim_get_current_buf() -- store its ID
end, { desc = "Toggle/focus terminal" })


local term_buf = nil

-- -- Intercept :! commands and open them in a persistent split terminal
-- vim.api.nvim_create_user_command("Bang", function(opts)
--   -- opts.args contains everything after :
--   -- Example: :Bang ls -la
--   local cmd = opts.args
--   if cmd == "" then
--     print("Usage: :Bang <command>")
--     return
--   end

--   -- Open a horizontal split with terminal
--   vim.cmd("split")
--   vim.cmd("resize 15") -- optional: terminal height
--   vim.cmd("terminal " .. cmd)
--   vim.cmd("startinsert") -- start in insert mode for terminal
-- end, {
--   nargs = "+", -- require at least one argument
--   complete = "shellcmd" -- shell command completion
-- })

-- -- Command-line mapping: when you type :!<cmd> it turns into :Bang <cmd>
-- vim.keymap.set("c", "!", function()
--   local cmdline = vim.fn.getcmdline()
--   -- only trigger if it's the first char (like :!ls)
--   if cmdline == "" then
--     return "Bang "
--   else
--     return "!"
--   end
-- end, { expr = true })


-- maybe tabbing
-- vim.keymap.set('n', '<C-^I>', '<C-^>', { noremap = true, silent = true })
-- vim.keymap.set('n', '<Esc>[27;5;9~', '<C-^>', { noremap = true, silent = true })
--
vim.keymap.set("n", "<leader>C", "<cmd>below Compile<CR>", { desc = "Compile in new tab" })



