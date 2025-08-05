-- ========================
--    Neovim init.lua
--    By Priyadeep
-- ========================


-- BOOTSTRAP lazy.nvim (auto-downloads if not found)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "git@github.com:folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- THEMES
    { "ellisonleao/gruvbox.nvim",        name = "gruvbox",          enabled = true },
    { "sainnhe/sonokai",                 name = "sonokai",          enabled = true },
    { "sainnhe/edge",                    name = "edge",             enabled = true },
    { "sainnhe/everforest",              name = "everforest",       enabled = true },
    { "sainnhe/gruvbox-material",        name = "gruvbox-material", enabled = true },
    { "rebelot/kanagawa.nvim",           name = "kanagawa",         enabled = true },
    { "rose-pine/neovim",                name = "rose-pine",        enabled = true },
    { "navarasu/onedark.nvim",           name = "onedark",          enabled = true },
    { "Mofiqul/vscode.nvim",             name = "vscode",           enabled = true },
    { "Mofiqul/dracula.nvim",            name = "dracula",          enabled = true },
    { "shaunsingh/nord.nvim",            name = "nord",             enabled = true },
    { "folke/tokyonight.nvim",           name = "tokyonight",       enabled = true },
    { "catppuccin/nvim",                 name = "catppuccin",       priority = 1000 },

    -- FILE TREE
    { "nvim-tree/nvim-tree.lua",         enabled = true },

    -- STATUS LINE
    { "nvim-lualine/lualine.nvim",       enabled = true },

    -- SYNTAX
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",       enabled = true },

    -- LSP + Autocomplete (optional)
    --   { "neovim/nvim-lspconfig", enabled = true },
    --   { "hrsh7th/nvim-cmp", enabled = true },
    --   { "hrsh7th/cmp-nvim-lsp", enabled = true },
})

-- TREE-SITTER CONFIGURATION
require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "c", "cpp", "rust", "python",
        "json", "yaml", "bash", "markdown"
    },

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true,
        -- Python indentation is often problematic
        disable = { "python" },
    },

    autopairs = {
        enable = true,
    },

    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
})



-- BASIC OPTIONS
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = false    -- Absolute line numbers only
vim.opt.tabstop = 4               -- Number of spaces tabs count for
vim.opt.shiftwidth = 4            -- Size of an indent
vim.opt.expandtab = true          -- Use spaces instead of tabs
vim.opt.smartindent = true        -- Smart auto-indenting
vim.opt.autoindent = true         -- Enable auto indentation
vim.opt.smarttab = true           -- Makes tabbing smarter
vim.opt.wrap = false              -- No line wrapping
vim.opt.scrolloff = 8             -- Keep cursor 8 lines above/below
vim.opt.termguicolors = true      -- Enable true color support
vim.opt.cursorline = true         -- Highlight current line
vim.opt.mouse = 'a'               -- Enable mouse support
vim.opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.opt.backup = false            -- Don't use backup files
vim.opt.writebackup = false
vim.opt.swapfile = false          -- No swap files
vim.opt.undofile = true           -- Persistent undo
vim.opt.updatetime = 300          -- Faster completion
vim.opt.signcolumn = 'yes'        -- Always show sign column

-- SYNTAX HIGHLIGHTING
vim.cmd('syntax enable')

-- FILETYPE PLUGIN AND INDENTATION
vim.cmd('filetype plugin indent on')

-- COLORS
require('catppuccin').setup({
    flavour = 'mocha', -- latte, frappe, macchiato, mocha
    transparent_background = true,
    term_colors = true,
    styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        loops = { 'italic' },
        functions = { 'bold' },
        keywords = { 'bold' },
        strings = { 'italic' },
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
    },
})

vim.cmd.colorscheme('gruvbox') -- Set the colorscheme

-- STATUS LINE (MINIMAL)
vim.opt.laststatus = 2
vim.opt.showmode = false

-- SEARCH SETTINGS
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true  -- But be smart about it
vim.opt.incsearch = true  -- Show search matches as you type
vim.opt.hlsearch = true   -- Highlight search matches

-- SPLIT WINDOWS
vim.opt.splitright = true
vim.opt.splitbelow = true

-- ENCODING
vim.scriptencoding = 'utf-8'
