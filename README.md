# gui-font-resize.nvim

A plugin for easily resizing font-sizes for your gui clients. This plugin resizes all the defined `vim.opt.guifont` in case you rely on fallback fonts when you replicate your config across different machines.

## Usage

The plugin provides the following commands with an optional parameter:
```lua
:GUIFontSizeUp {n?}
-- Increases font size by `n` - value is absolute and will always increase

:GUIFontSizeDown {n?}
-- Decreases font size by `n` - value is absolute and will always decrease

:GUIFontSizeSet {n?}
-- Set font size to `n`, if not specified it will set the default font size to 11 (Can be changed on the configuration file

:GUIFontSizeChangeBy {n?}
-- ChangeBy accepts positive and negative values you can do things like
-- :GUIFontSizeChangeBy +10
-- :GUIFontSizeChangeBy -10
```

## Configuration / Settings
```lua
options = {
    default_size = 11, -- absolute size it will fallback to when :GUIFontSizeSet is not specified
    change_by = 1, -- step value that will inc/dec the fontsize by
    bounds = {
        maximum = 24, -- maximum font size, when you try to set a size bigger than this it will default to max
        minimum = 8, -- any modification lower than 8 will spring back to 8
    },
}

require("gui-font-resize").setup({ default_size = 10, change_by = 1, bounds = { maximum = 20 } })
```

## Requirements

Neovim `0.7` or higher

## Installation

With Packer

```lua
use({
    "ktunprasert/gui-font-resize.nvim",
    config = function() require("gui-font-resize").setup() end,
})
```

## Example Usage

```lua
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<A-Up>", "<cmd>:GUIFontSizeUp<CR>", opts)
vim.keymap.set("n", "<A-Down>", "<cmd>:GUIFontSizeDown<CR>", opts)
vim.keymap.set("n", "<A-0>", "<cmd>:GUIFontSizeSet<CR>", opts)
```

## License

This project is under MIT license.

