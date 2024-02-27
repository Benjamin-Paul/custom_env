local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<leader>p', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>n', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<leader>mp', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<leader>mn', '<Cmd>BufferMoveNext<CR>', opts)

-- Close buffer
map('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)


