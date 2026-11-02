-- LSP setup using Neovim's built-in client (0.11+ API).
-- nvim-lspconfig only supplies the default server definitions (cmd, filetypes, root markers).
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "saghen/blink.cmp" },
    config = function()
      -- Tell every server the completion menu supports snippets, docs, etc.
      vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })

      -- Rust: rust-analyzer comes from `rustup component add rust-analyzer`
      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy" }, -- show clippy lints, not just compiler errors
            cargo = { allFeatures = true },
          },
        },
      })
      vim.lsp.enable("rust_analyzer")

      vim.diagnostic.config({ virtual_text = true, severity_sort = true })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user-lsp-attach", { clear = true }),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local buf = ev.buf

          -- Format with rustfmt (via the LSP) on save
          if client:supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = vim.api.nvim_create_augroup("user-lsp-format-" .. buf, { clear = true }),
              buffer = buf,
              callback = function() vim.lsp.buf.format({ bufnr = buf, id = client.id }) end,
            })
          end

          -- Inlay type hints (toggle with <leader>th)
          if client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = buf })
            vim.keymap.set("n", "<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
            end, { buffer = buf, desc = "Toggle inlay hints" })
          end

          local map = function(keys, fn, desc) vim.keymap.set("n", keys, fn, { buffer = buf, desc = desc }) end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          -- Built-in defaults also available: K hover docs, grn rename, gra code action,
          -- grr references, gri implementation, <C-s> (insert) signature help
          map("<leader>e", vim.diagnostic.open_float, "Show line diagnostics")
        end,
      })
    end,
  },
}
