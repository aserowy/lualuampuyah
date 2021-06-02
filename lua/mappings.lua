local keymaps = require'nvim.keymaps'

local mappings = {}

local function yank_to_plus()
    keymaps.register('n', {
        ['y'] = '"+y',
        ['Y'] = '"+Y',
        ['p'] = '"+p',
        ['P'] = '"+P',
    })

    keymaps.register('v', {
        ['y'] = '"+y',
        ['Y'] = '"+Y',
        ['p'] = '"+p',
        ['P'] = '"+P',
    })
end

local function zen()
    keymaps.register('n', {
        ['<C-z>'] = [[<cmd>ZenMode<cr>]]
    })
end

local function functions()
    keymaps.register('n', {
        ['<C-a>'] = [[<cmd>TodoTrouble<cr>]],
        ['<C-e>'] = [[<cmd>lua require'navigation.tree'.open()<cr>]],
        ['<C-f><C-b>'] = [[<cmd>lua require'telescope.builtin'.buffers()<cr>]],
        ['<C-f><C-f>'] = [[<cmd>lua require'navigation.search'.git_or_local()<cr>]],
        ['<C-f><C-g>'] = [[<cmd>lua require'telescope.builtin'.live_grep()<cr>]],
        ['<C-f><C-h>'] = [[<cmd>lua require'telescope.builtin'.oldfiles()<cr>]],
        ['<C-f><C-l>'] = [[<cmd>lua require'telescope.builtin'.lsp_document_symbols()<cr>]],
        ['<C-f><C-s>'] = [[<cmd>lua require'telescope.builtin'.lsp_workspace_symbols()<cr>]],
        ['<C-q>'] = [[<cmd>LspTrouble quickfix<cr>]],
        ['<C-x>'] = [[<cmd>LspTrouble lsp_workspace_diagnostics<cr>]],
    })
end

mappings.functions_terminal = '<C-t>'

local function window_focus()
    keymaps.register('n', {
        ['<C-j>'] = '<C-w><C-j>',
        ['<C-k>'] = '<C-w><C-k>',
        ['<C-l>'] = '<C-w><C-l>',
        ['<C-h>'] = '<C-w><C-h>',
    })
end

local function buffer()
    keymaps.register('n', {
        ['<C-b><C-n>'] = [[<cmd>enew<cr>]],
        ['<C-b><C-s>'] = [[<cmd>w<cr>]],
        ['<C-c>'] = [[<cmd>BufferClose<cr>]],
        ['<C-n>'] = [[<cmd>BufferNext<cr>]],
        ['<C-p>'] = [[<cmd>BufferPrevious<cr>]],

        ['ga'] = [[gg=G<C-o>zz<cmd>Neoformat<cr>]],
    })
end

-- editor
mappings.editor_on_text = {
    ['gd'] = [[<cmd>lua require'telescope.builtin'.lsp_definitions()<cr>]],
    ['gf'] = '<cmd>lua vim.lsp.buf.declaration()<cr>',
    ['gH'] = [[<cmd>lua require'telescope.builtin'.lsp_references()<cr>]],
    ['gi'] = '<cmd>lua vim.lsp.buf.implementation()<cr>',
    ['K'] = '<cmd>lua vim.lsp.buf.hover()<cr>',
    ['gh'] = '<cmd>lua vim.lsp.buf.signature_help()<cr>',
    ['gr'] = '<cmd>lua vim.lsp.buf.rename()<cr>',
    ['gq'] = [[<cmd>lua require'telescope.builtin'.lsp_code_actions()<cr>]],
    ['gp'] = [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<cr>]],
    ['gn'] = [[<cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<cr>]],
}

local function editor_completion()
    keymaps.register('i', {
        ['<cr>'] = [[v:lua.completion.confirm()]],
        ['<S-tab>'] = [[v:lua.completion.jump_previous('<S-tab>')]],
        ['<tab>'] = [[v:lua.completion.jump_next('<tab>')]],
    }, {expr = true})

    keymaps.register('s', {
        ['<cr>'] = [[v:lua.completion.confirm()]],
        ['<S-tab>'] = [[v:lua.completion.jump_previous('<S-tab>')]],
        ['<tab>'] = [[v:lua.completion.jump_next('<tab>')]],
    }, {expr = true})
end

local function editor_motion()
    keymaps.register('n', {
        ['<leader>k'] = [[<cmd>HopChar1<cr>]],
        ['<leader>l'] = [[<cmd>HopLine<cr>]],
        ['<leader>w'] = [[<cmd>HopWord<cr>]],
    })
end

mappings.editor_motion_textobjects = {
    ['af'] = '@function.outer',
    ['if'] = '@function.inner',
    ['ac'] = '@class.outer',
    ['ic'] = '@class.inner',
}

mappings.explorer = {
    ['l'] = 'edit',
    ['h'] = 'close_node',
    ['r'] = 'full_rename',
    ['m'] = 'cut',
    ['d'] = 'remove',
    ['y'] = 'copy',
}

mappings.explorer_nocallback = {
    ['<C-c>'] = [[<cmd>lua require'navigation.tree'.close()<cr>]],
    ['q'] = [[<cmd>lua require'navigation.tree'.close()<cr>]],
}

mappings.diagnostics = {
    ['close'] = '<C-c>',
    ['cancel'] = '<C-k>',
    ['refresh'] = 'r',
    ['jump'] = '<cr>',
    ['hover'] = 'K',
    ['toggle_fold'] = '<space>',
    ['previous'] = '<C-p>',
    ['next'] = '<C-n>',
}

mappings.search = function(actions)
    return {
        ['<C-q>'] = actions.send_to_qflist
    }
end

local function terminal()
    keymaps.register('t', {
        ['<C-k>'] = [[<C-\><C-n><C-w><C-k>]],
        ['<C-j>'] = [[<cmd>ToggleTerm<cr>]],
    })
end

mappings.setup = function()
    yank_to_plus()
    zen()
    functions()
    window_focus()
    buffer()
    editor_completion()
    editor_motion()
    terminal()
end

return mappings
