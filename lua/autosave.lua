-- [[ Autosave Options ]]
-- Formatting when save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
