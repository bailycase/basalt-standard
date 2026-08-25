# Basalt for Neovim

Basalt uses Neovim's native `background` option, so one colorscheme covers both variants. The included watcher follows Shepherd's active appearance without restarting Neovim.

## Install

Add this port to Neovim's runtime path. For this repository's default location:

```lua
vim.opt.runtimepath:prepend(vim.fn.expand("~/Developer/basalt-standard/ports/neovim"))
require("basalt").setup()
```

Without Shepherd, choose a variant normally:

```lua
vim.o.background = "light" -- or "dark"
vim.cmd.colorscheme("basalt")
```

## Shepherd sync

Shepherd writes `shepherd-active-theme` in its Application Support directory. The file contains `basalt-dark` or `basalt-light`. The watcher reads it on startup and after each appearance change.

Production Shepherd uses:

```text
~/Library/Application Support/Shepherd/shepherd-active-theme
```

To follow a development build or another support directory, set the marker path before setup:

```lua
require("basalt").setup({
  path = vim.fn.expand("~/Library/Application Support/Shepherd-dev/shepherd-active-theme"),
})
```

The watcher uses Neovim's built-in `vim.uv` APIs and has no dependencies.
