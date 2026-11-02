-- "Liquid glass" look: transparent editor so WezTerm's translucent background shows through,
-- frosted (blended) floating windows and popups with rounded, softly-lit borders.
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "dark", -- floats keep a tinted bg so winblend can "frost" them
        },
        on_highlights = function(hl, c)
          local glass = "#1a1f35"
          local edge = "#8fa3d9" -- pale highlight, like light catching a glass edge
          hl.NormalFloat = { bg = glass, fg = c.fg }
          hl.FloatBorder = { bg = glass, fg = edge }
          hl.FloatTitle = { bg = glass, fg = "#c0d2ff", bold = true }
          hl.Pmenu = { bg = glass, fg = c.fg }
          hl.PmenuSel = { bg = "#2e3c66", fg = "#e6ecff", bold = true }
          hl.PmenuSbar = { bg = glass }
          hl.PmenuThumb = { bg = "#3b4a78" }
          hl.CursorLine = { bg = "#1e2440" }
          hl.CursorLineNr = { fg = "#a9c7ff", bold = true }
          hl.LineNr = { fg = "#3b4261" }
          hl.WinSeparator = { fg = "#3b4a78" }
          hl.StatusLine = { bg = "NONE", fg = "#a9b1d6" }
          hl.StatusLineNC = { bg = "NONE", fg = "#565f89" }
          hl.Visual = { bg = "#2e3c66" }
        end,
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
