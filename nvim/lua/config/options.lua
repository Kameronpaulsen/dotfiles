-- UI options for the "liquid glass" look
vim.o.termguicolors = true
vim.o.winborder = "rounded" -- rounded borders on all floating windows (hover, diagnostics, etc.)
vim.o.winblend = 3          -- frosted, slightly see-through floating windows
vim.o.pumblend = 3          -- same for the completion popup
vim.o.cursorline = true
vim.o.number = true
vim.o.laststatus = 3        -- one slim global statusline instead of one per split
vim.o.fillchars = "eob: ,vert:│"  -- hide the ~ on empty lines; thin split lines
