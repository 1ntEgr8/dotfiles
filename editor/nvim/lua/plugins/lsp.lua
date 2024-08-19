return {
  {
    "neovim/nvim-lspconfig",

    config = function()
      local lspconfig = require("lspconfig")

      -- keymaps
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'lsp: ' .. desc })
          end
          
          map('<space>rn', vim.lsp.buf.rename, "rename")
          map('gt', vim.lsp.buf.type_definition, "jump to type definition")
        end,
      })

      -- setup servers
      lspconfig.pyright.setup{}
    end,
  },
}
