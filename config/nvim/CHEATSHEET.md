# Neovim Cheatsheet

Your personal reference guide for Neovim keybindings and features.

---

## 🎯 Leader Key

Your **leader key** is `Space`. Press `Space` and wait a moment to see all available commands!

---

## 📁 File Management

| Key | Action |
|-----|--------|
| `<Space>e` | Toggle file explorer (nvim-tree) |
| `<Space>w` | Save current file |
| `<Space>q` | Quit current window |
| `<Space>x` | Save and quit |

### Inside File Explorer (nvim-tree)
- `Enter` - Open file/folder
- `a` - Create new file
- `d` - Delete file
- `r` - Rename file
- `q` - Close file explorer

---

## 🔍 Search & Find (Telescope)

| Key | Action |
|-----|--------|
| `<Space>ff` | Find files by name |
| `<Space>fg` | Live grep (search inside files) |
| `<Space>fb` | Find open buffers |
| `<Space>fh` | Search help documentation |

### Inside Telescope
- `Ctrl-j` / `Ctrl-k` - Navigate up/down
- `Enter` - Select and open
- `Esc` - Close search
- `Ctrl-c` - Close search

---

## 🧠 LSP (Language Server) Features

These work when you're editing code files (Python, Rust, Go, Lua, C, C++, Zig).

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Show all references |
| `K` | Show documentation/hover info |
| `<Space>rn` | Rename symbol (variable/function) |
| `<Space>ca` | Code actions (fixes/refactorings) |
| `<Space>f` | Format current file |

---

## 🎨 Visual Mode (Selecting Text)

First, enter Visual mode with `v` (character), `V` (line), or `Ctrl-v` (block).

| Key | Action |
|-----|--------|
| `<` | Indent left (stays selected) |
| `>` | Indent right (stays selected) |
| `J` | Move selected lines down |
| `K` | Move selected lines up |
| `gcc` | Comment/uncomment selection |

---

## 🪟 Window Management

| Key | Action |
|-----|--------|
| `Ctrl-h` | Move to left window |
| `Ctrl-j` | Move to lower window |
| `Ctrl-k` | Move to upper window |
| `Ctrl-l` | Move to right window |

---

## 🔎 Search & Highlighting

| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next search result |
| `N` | Previous search result |
| `Esc` | Clear search highlighting |

---

## 📝 Editing Shortcuts

| Key | Action |
|-----|--------|
| `gcc` | Comment/uncomment current line |
| `gc` (visual) | Comment/uncomment selection |
| `u` | Undo |
| `Ctrl-r` | Redo |
| `dd` | Delete current line |
| `yy` | Copy (yank) current line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |

---

## 📊 Status Bar (Bottom of Screen)

Your status bar shows:
- **Left:** Current mode (NORMAL, INSERT, VISUAL)
- **Middle Left:** Git branch, changes, errors/warnings
- **Center:** Current filename
- **Right:** File encoding, format, type
- **Far Right:** Line:column position, percentage through file

---

## 🎨 Themes & Appearance

Your colorscheme is **Gruvbox** (hard contrast).

---

## 🔧 Auto-completion

When typing code, a popup menu appears with suggestions.

| Key | Action |
|-----|--------|
| `Tab` | Next suggestion |
| `Shift-Tab` | Previous suggestion |
| `Enter` | Accept suggestion |
| `Ctrl-Space` | Manually trigger completion |
| `Ctrl-e` | Close completion menu |
| `Ctrl-b` | Scroll docs up |
| `Ctrl-f` | Scroll docs down |

---

## 🌳 Git Integration (Gitsigns)

Git status appears in the left gutter:
- `+` - Added lines
- `~` - Changed lines
- `_` - Deleted lines

---

## 📦 Installed Language Servers

Your LSP is configured for:
- **Python** - pyright
- **Go** - gopls
- **Rust** - rust-analyzer
- **Lua** - lua_ls
- **C/C++** - clangd
- **Zig** - zls

---

## 🎨 Formatters

Auto-format on save for:
- **Python** - black
- **Lua** - stylua
- **Go** - gofmt
- **Rust** - rustfmt

---

## 🆘 Getting Help

| Command | Action |
|---------|--------|
| `:help <topic>` | Open help for a topic |
| `:Tutor` | Interactive Vim tutorial |
| `<Space>` (wait) | See available commands (which-key) |
| `:checkhealth` | Check plugin/LSP status |

---

## 🚀 Plugin Management

| Command | Action |
|---------|--------|
| `:Lazy` | Open plugin manager |
| `:Lazy sync` | Update all plugins |
| `:Lazy clean` | Remove unused plugins |

---

## 💡 Pro Tips

1. **Explore with Which-Key:** Press `Space` and pause to discover commands
2. **Quick Navigation:** Use `gd` to jump to function definitions
3. **Format Before Commit:** Files auto-format on save!
4. **Visual Block Mode:** `Ctrl-v` lets you edit columns of text
5. **Repeat Commands:** `.` repeats your last change
6. **Quick File Switching:** `<Space>fb` shows recent files

---

## 🎓 Vim Basics (If You're New)

### Modes
- **Normal Mode** - Navigation and commands (press `Esc` to get here)
- **Insert Mode** - Type text (press `i` to enter)
- **Visual Mode** - Select text (press `v` to enter)
- **Command Mode** - Run commands (press `:` to enter)

### Basic Navigation (Normal Mode)
- `h` - Left
- `j` - Down
- `k` - Up
- `l` - Right
- `w` - Next word
- `b` - Previous word
- `0` - Start of line
- `$` - End of line
- `gg` - Top of file
- `G` - Bottom of file

### Entering Insert Mode
- `i` - Insert before cursor
- `a` - Insert after cursor
- `I` - Insert at start of line
- `A` - Insert at end of line
- `o` - New line below
- `O` - New line above

---

**Happy coding!** 🎉

*Last updated: 2025-12-01*
