-- ===============================================================
-- =============== TREE-SITTER PARSERS INSTALLED =================
-- ===============================================================
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "cpp",
    "dockerfile",
    "go",
    "json",
    "lua",
    "make",
    "python",
    "regex",
    "rust",
    "terraform",
    "yaml"
}


-- =========================================
-- =============== GENERAL =================
-- =========================================
lvim.log.level = "warn"
lvim.format_on_save = false
vim.opt.shiftwidth = 4


-- ===========================================================
-- =============== STATUS LINE CONFIGURATION =================
-- ===========================================================
local custom_seoul = require("lualine.themes.seoul256")
custom_seoul.normal.b.bg = "#011f4b"
custom_seoul.normal.b.fg = "#eeeeee"
custom_seoul.insert.b.bg = "#011f4b"
custom_seoul.insert.b.fg = "#eeeeee"
custom_seoul.visual.b.bg = "#011f4b"
custom_seoul.visual.b.fg = "#eeeeee"
custom_seoul.insert.a.bg = "#808080"
custom_seoul.insert.a.fg = "#000000"
custom_seoul.normal.a.bg = "#444444"
custom_seoul.normal.a.fg = "#d0d0d0"
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.options.theme = custom_seoul
lvim.builtin.lualine.sections.lualine_a = {""}
-- lvim.builtin.lualine.sections.lualine_b = {"filetype", "vim.fn.trim(vim.fn.system('pwd'))"}
lvim.builtin.lualine.sections.lualine_b = {
    {
        "filetype",
        separator = {
            left = "",
            right = ""
        }
    },
    {
        "buffers",
        buffers_color = {
            active = 'lualine_a_insert',
            inactive = 'lualine_a_normal'
        },
        symbols = {
            alternate_file = ''
        },
    }
}
lvim.builtin.lualine.sections.lualine_c = {""}
lvim.builtin.lualine.sections.lualine_x = {""}
lvim.builtin.lualine.sections.lualine_y = {""}
lvim.builtin.lualine.sections.lualine_z = {
    {
        "branch",
        separator = {
            left = "", -- in insert mode, use Ctrl+Q and then type ue0b6 to get that character
            right = "" -- with the same setup, type ue0b4 to get the other half of the circle
        }
    }
}


-- ===========================================================
-- =============== BUFFER LINE CONFIGURATION =================
-- ===========================================================
lvim.builtin.bufferline.active = false
lvim.builtin.breadcrumbs.active = false
-- lvim.builtin.bufferline.options.always_show_bufferline = false
-- lvim.builtin.bufferline.options.separator_style = "slant"


-- ==============================================
-- =============== COLORSCHEMES =================
-- ==============================================
-- lvim.colorscheme = "gotham" -- profound matrix-like but very dark colors
-- lvim.colorscheme = "gruvbox" -- honest autumn colors
-- lvim.colorscheme = "rose-pine" -- well-rounded high-contrast colors
-- lvim.colorscheme = "vscode" -- beautiful and peaceful vscode colors
-- lvim.colorscheme = "OceanicNext"
-- lvim.colorscheme = "oceanic_material" -- energic lime and dark blue colors
lvim.colorscheme = "catppuccin-mocha"
-- lvim.colorscheme = "happy_hacking"
-- lvim.colorscheme = "jellybeans"
-- lvim.colorscheme = "lunar"


-- ================================================
-- =============== CURSOR STYLING =================
-- ================================================
vim.opt.guicursor = "n:ver20-TermCursorNC,i-v-c-ci-ve:ver20,i-v-c-ci-ve:blinkwait700-blinkoff400-blinkon250-TermCursorNC/lCursor"


-- ============================================================
-- =============== KEYMAPPINGS AND REMAPPINGS =================
-- ============================================================
-- View all the defaults by pressing <leader>Lk
-- vim.api.nvim_set_keymap('i', '<M-0>', 'copilot#Accept("<CR>")', { expr = true, silent = true })  -- accept copilot suggestion with alt+0
-- vim.api.nvim_set_keymap('i', '<M-t>', '\t', { noremap = true, silent = true })  -- tab key to insert a tab          
lvim.keys.normal_mode["<M-p>"] = ":w<CR>:!python3 %<CR>"
lvim.builtin.which_key.mappings["n"] = { "<cmd>bn<cr>", "Next Buffer" } -- <leader>n to go to next buffer
lvim.builtin.which_key.mappings["p"] = { "<cmd>bp<cr>", "Previous Buffer" } -- <leader>p to go to previous buffer
local cmp = require("cmp")
lvim.builtin.cmp.mapping["<Right>"] = cmp.mapping.abort()
lvim.builtin.cmp.experimental.ghost_text = true


-- =============================================
-- =============== MY PLUGGINS =================
-- =============================================
lvim.plugins = {
    -- a few colorschemes
    { "rafi/awesome-vim-colorschemes" },
    { "rebelot/kanagawa.nvim" },
    { "catppuccin/nvim",              name = "catppuccin" },
    { "rose-pine/neovim",             name = "rose-pine" },
    { "Mofiqul/vscode.nvim" },
    -- simple plugin to softly highlight the current line
    {
        "miyakogi/conoline.vim",
        -- an init function that can be used to change the current line color highlighting
        init = function()
            vim.cmd [[let g:conoline_color_normal_dark = 'guibg=#303030']]
            vim.cmd [[let g:conoline_color_normal_nr_dark = 'guibg=#303030']]
            vim.cmd [[let g:conoline_color_insert_dark = 'guibg=#1c1c1c']]
            vim.cmd [[let g:conoline_color_insert_nr_dark = 'guibg=#1c1c1c']]
        end,
    },
    -- copilot integration and configuration
    {
        "zbirenbaum/copilot-cmp",
        event = "InsertEnter",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
                require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
            end, 100)
        end,
    },
}
