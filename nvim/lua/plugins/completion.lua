-- IntelliSense-style completion: menu as you type, docs preview, signature help, snippets.
-- Sources come from the LSP (rust-analyzer), the current buffer, file paths and snippets.
return {
  {
    "saghen/blink.cmp",
    version = "1.*", -- release tags ship a prebuilt fuzzy matcher (no Rust build needed)
    dependencies = { "rafamadriz/friendly-snippets" },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      -- <C-space> open menu / docs, <C-y> accept, <C-n>/<C-p> or Up/Down move, <C-e> close,
      -- <Tab>/<S-Tab> jump through snippet placeholders. Enter also accepts.
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
      },
      appearance = { nerd_font_variant = "mono" },
      completion = {
        list = { selection = { preselect = true, auto_insert = false } },
        menu = {
          border = "rounded",
          winblend = vim.o.pumblend,
          draw = { treesitter = { "lsp" } },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "rounded", winblend = vim.o.winblend },
        },
        ghost_text = { enabled = true },
      },
      signature = { enabled = true, window = { border = "rounded", winblend = vim.o.winblend } },
      sources = { default = { "lsp", "path", "snippets", "buffer" } },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },
}
