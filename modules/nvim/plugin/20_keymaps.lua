local map = vim.keymap.set

map('n', '<Esc>', '<Cmd>nohlsearch<CR>')

-- map('n', 'j', 'gj', { noremap = true, silent = true })
-- map('n', 'k', 'gk', { noremap = true, silent = true })
-- map('v', 'j', 'gj', { noremap = true, silent = true })
-- map('v', 'k', 'gk', { noremap = true, silent = true })

map('n', 'grd', function()
  vim.lsp.buf.definition()
end)

map('n', 'grD', function()
  vim.lsp.buf.declaration()
end)

map('n', '<leader>e', function()
  require('mini.files').open()
end)
map('n', '<leader>fe', '<Cmd>Pick files<CR>')
map('n', '<leader>ff', '<Cmd>Pick files<CR>')
map('n', '<leader>f:', '<Cmd>Pick history scope=":"<CR>')
map('n', '<leader>fa', '<Cmd>Pick git_hunks scope="staged"<CR>')
map('n', '<leader>fA', '<Cmd>Pick git_hunks path="%" scope="staged"<CR>')
map('n', '<leader>fb', '<Cmd>Pick buffers<CR>')
map('n', '<leader>fc', '<Cmd>Pick git_commits<CR>')
map('n', '<leader>fC', '<Cmd>Pick git_commits path="%"<CR>')
map('n', '<leader>fd', '<Cmd>Pick diagnostic scope="all"<CR>')
map('n', '<leader>fD', '<Cmd>Pick diagnostic scope="current"<CR>')
map('n', '<leader>ff', '<Cmd>Pick files<CR>')
map('n', '<leader>fg', '<Cmd>Pick grep_live<CR>')
map('n', '<leader>fG', '<Cmd>Pick grep pattern="<cword>"<CR>')
map('n', '<leader>fh', '<Cmd>Pick help<CR>')
map('n', '<leader>fH', '<Cmd>Pick hl_groups<CR>')
map('n', '<leader>fl', '<Cmd>Pick buf_lines scope="all"<CR>')
map('n', '<leader>fL', '<Cmd>Pick buf_lines scope="current"<CR>')
map('n', '<leader>fm', '<Cmd>Pick git_hunks<CR>')
map('n', '<leader>fM', '<Cmd>Pick git_hunks path="%"<CR>')
map('n', '<leader>fr', '<Cmd>Pick resume<CR>')
map('n', '<leader>fR', '<Cmd>Pick lsp scope="references"<CR>')
map('n', '<leader>fs', '<Cmd>Pick lsp scope="workspace_symbol_live"<CR>')
map('n', '<leader>fS', '<Cmd>Pick lsp scope="document_symbol"<CR>')
map('n', '<leader>fv', '<Cmd>Pick visit_paths cwd=""<CR>')
map('n', '<leader>fV', '<Cmd>Pick visit_paths<CR>')

map('n', '<leader>bd', function()
  require('mini.bufremove').delete()
end)

map('n', '<leader>st', function()
  vim.cmd.new()
  vim.cmd.term()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, math.floor(vim.o.lines * 0.25))
end)

-- Autocommands

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
