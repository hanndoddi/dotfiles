
# hanndoddi's Neovim Config

My never-ending personal Neovim setup, customized for my workflow working with embedded systems, Markdown, and other tools.

I use:
- **Lazy.nvim** for plugin management
- **Nerd Fonts** with a Gruvbox theme
- Logical <leader> mappings organized with which-key
- Full LSP, formatter, and debugger setup for C, Python, Arduino, MicroPython
- Custom terminal integration via toggleterm and Kitty

I work primarily in Linux Mint with the Kitty terminal and Zsh.

---

## Plugin Setup

Plugins are defined as individual files inside `lua/hanndoddi/plugins/`, typically one file per plugin or related plugin set.

Examples include:
- `telescope.lua` – fuzzy finder setup
- `nvim-cmp.lua` – autocompletion
- `toggleterm.lua` – terminal integration
- `micro-python.lua` – MicroPython dev tools
- `todo-comments.lua`, `markdown.lua`, `trouble.lua`, etc.

Each `.lua` file returns a plugin spec and is lazy-loaded automatically on startup. I'm Lazy so I simply remove the .lua when I stop using a plugin but want to keep the config. I you want to try them just add .lua for the inactive ones.

---

## Key Features

-  Not super slow startup
-  Intuitive leader key mappings
-  Smooth embedded dev experience
-  Markdown & documentation friendly
-  Custom visual tweaks for Kitty and Gruvbox

---

## Future Plans

- Streamline plugin group loading
- Experiment with noice.nvim or other UIs
- Add notes per plugin here or under lua/hanndoddi/plugins

