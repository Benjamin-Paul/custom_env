-- linking lua configuration files and plugins
require("plugins")
require("mason-config")
require("remap")
require("barbar-config")
require("lspconfig").pylsp.setup{}
require("nvim-cmp")

-- standard vim configuration options
vim.cmd("highlight Pmenu ctermfg=white ctermbg=237")
vim.cmd("highlight PmenuSel ctermfg=white ctermbg=243")
vim.cmd("highlight CmpItemAbbr ctermbg=none ctermfg=68")
vim.cmd("highlight BufferDefaultTabpagesSep ctermbg=blue ctermfg=blue")
vim.cmd("highlight BufferInactive ctermbg=242 ctermfg=white")
-- BufferTabpagesSep
-- vim.cmd("highlight CmpItemKind ctermbg=none ctermfg=white")
-- vim.cmd("highlight CmpItemMenu ctermbg=none ctermfg=white")
-- vim.cmd("highlight CmpItemMenuDefault ctermbg=none ctermfg=white")
vim.cmd("syntax on")
vim.cmd("set number")
vim.cmd("set ls=2")
vim.cmd("highlight LineNr ctermfg=darkgrey")
vim.cmd("highlight NonText ctermfg=black")
vim.cmd("highlight StatusLine ctermfg=darkgrey")
vim.cmd("set laststatus=0")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set softtabstop=4")
vim.cmd("set expandtab")
vim.cmd("set autoindent")
vim.cmd("map <M-p> :w<CR>:!python3 %<CR>")
vim.cmd("set backspace=2")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set noswapfile")
vim.cmd("set hlsearch")
vim.cmd("set incsearch")
vim.cmd("set ignorecase")
vim.cmd("set showmatch")
vim.cmd("set mouse=a")
vim.cmd("set ttyfast")
vim.cmd("filetype plugin on ")

-- cursor style
vim.opt.guicursor = "n:ver20,i-v-c-ci-ve:ver20,i-v-c-ci-ve:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"

-- rust-tools setup
local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
