lua << EOF
local nvim_lsp = require('lspconfig')
EOF

noremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
noremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
noremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
noremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
noremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
noremap <silent> <space>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
noremap <silent> <space>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
noremap <silent> <space>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
noremap <silent> <space>D <cmd>lua vim.lsp.buf.type_definition()<CR>
noremap <silent> <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
noremap <silent> <space>ca <cmd>lua vim.lsp.buf.code_action()<CR>
noremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
noremap <silent> <space>e <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
noremap <silent> <space>dj <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
noremap <silent> <space>dk <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
noremap <silent> <space>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
noremap <silent> <space>f <cmd>lua vim.lsp.buf.formatting()<CR>

lua << EOF
local util = require 'lspconfig/util'

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  severity_sort = true
  }
)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
    'update_in_insert'
    }
  }

require'lspconfig'.rls.setup {
  capabilities = capabilities,
  }

require'lspconfig'.pyright.setup {
  capabilities = capabilities,
  }

require'lspconfig'.clangd.setup {
  capabilities = capabilities,
  }

-- require'lspconfig'.solang.setup {
--   capabilities = capabilities,
--   }
--
-- require'lspconfig'.jdtls.setup {
--   capabilities = capabilities,
--   }
--
-- require'lspconfig'.tsserver.setup {
--   capabilities = capabilities,
--   }

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

EOF
