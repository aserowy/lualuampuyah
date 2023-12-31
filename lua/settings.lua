local M = {
    theme = {
        name = "monokai",
        style = "pro",
        transparent = false,
    },
}

function M.setup()
    require("nvim.terminal").setup()

    vim.g.mapleader = "["

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd

    autocmd("BufWritePre", {
        group = augroup("StripTrailingWhitespace", {}),
        pattern = "*",
        command = [[%s/\s\+$//e]],
    })

    -- FIX: currently not working: vim.opt.formatoptions:remove { "c", "r", "o" }
    -- https://github.com/neovim/neovim/blob/a49924a318520a3b5c2f210f22a8d450165e89b5/runtime/ftplugin/lua.vim#L20
    autocmd("FileType", {
        command = "set formatoptions-=cro",
    })

    autocmd("TextYankPost", {
        group = augroup("HighlightYank", {}),
        pattern = "*",
        callback = function()
            vim.highlight.on_yank({
                higroup = "IncSearch",
                timeout = 250,
            })
        end,
    })

    -- options
    vim.opt.clipboard = "unnamed,unnamedplus"

    vim.opt.backup = false
    vim.opt.ignorecase = true
    vim.opt.mouse = "a"
    vim.opt.undofile = true
    vim.opt.showmode = false
    vim.opt.smartcase = true
    vim.opt.splitbelow = true
    vim.opt.splitright = true
    vim.opt.swapfile = false
    vim.opt.termguicolors = true

    vim.opt.expandtab = true
    vim.opt.fillchars.eob = "\\ "
    vim.opt.shiftwidth = 4
    vim.opt.shortmess:append({ c = true })
    vim.opt.softtabstop = 4
    vim.opt.tabstop = 4
    vim.opt.wrap = false

    vim.opt.colorcolumn = "80"
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.signcolumn = "yes:2"
end

return M
