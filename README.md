# Neovim Keybinding Reference

> **Leader key = `Space`**  
> Keybindings shown as `<leader>` mean hold nothing — just press `Space` then the next key.  
> `<C-x>` means `Ctrl + x`. `<S-x>` means `Shift + x`.

---

## Table of Contents

1. [Custom Keybindings](#custom-keybindings)
   - [Global](#global)
   - [LSP — Language Features](#lsp--language-features)
   - [Git — Gitsigns](#git--gitsigns)
   - [File Navigation — Harpoon](#file-navigation--harpoon)
   - [Fuzzy Finding — Telescope](#fuzzy-finding--telescope)
   - [Completion — nvim-cmp](#completion--nvim-cmp)
   - [Surround — nvim-surround](#surround--nvim-surround)
2. [Built-in Neovim Keybindings](#built-in-neovim-keybindings)
   - [Navigation — Basic](#navigation--basic-learn-these-first)
   - [Navigation — Intermediate](#navigation--intermediate)
   - [Navigation — Advanced](#navigation--advanced)
   - [Selecting Lines and Code Blocks](#selecting-lines-and-code-blocks)
   - [Text Objects](#text-objects--the-key-to-fast-editing)
   - [Editing](#editing)
   - [Search & Replace](#search--replace)
   - [Marks & Registers](#marks--registers)
   - [Folds](#folds)
   - [Visual Mode](#visual-mode)
   - [Insert Mode](#insert-mode)
   - [Command Mode](#command-mode)
   - [Windows & Splits](#windows--splits)
   - [Tabs](#tabs)

---

## Custom Keybindings

### Global

| Key | Mode | Action |
|-----|------|--------|
| `<leader>cd` | Normal | Open file explorer (netrw) |
| `p` | Visual | Paste over selection **without** losing your yanked text |
| `<leader>d` | Normal / Visual | Delete without overwriting the yank register |

---

### LSP — Language Features

> These only activate when a language server has attached to the buffer (i.e. when you open a supported file type like `.ts`, `.py`, `.lua`, `.cpp`, etc.).

| Key | Mode | Action |
|-----|------|--------|
| `K` | Normal | Show hover documentation for symbol under cursor |
| `gd` | Normal | Go to definition |
| `gD` | Normal | Go to declaration |
| `gi` | Normal | Go to implementation |
| `go` | Normal | Go to type definition |
| `gr` | Normal | Show all references |
| `gs` | Normal | Show signature help (function parameters) |
| `gl` | Normal | Open diagnostics float (show error/warning detail) |
| `<F2>` | Normal | Rename symbol across the project |
| `<F3>` | Normal / Visual | Format buffer or selection (async) |
| `<F4>` | Normal | Code action (quick fixes, imports, etc.) |

---

### Git — Gitsigns

> Only active when the file is inside a git repository.  
> A "hunk" is a contiguous block of changed lines.

| Key | Mode | Action |
|-----|------|--------|
| `]h` | Normal | Jump to next hunk (change) |
| `[h` | Normal | Jump to previous hunk |
| `<leader>hs` | Normal | Stage hunk under cursor |
| `<leader>hr` | Normal | Reset hunk under cursor |
| `<leader>hS` | Normal | Stage entire buffer |
| `<leader>hu` | Normal | Undo last staged hunk |
| `<leader>hR` | Normal | Reset entire buffer to HEAD |
| `<leader>hp` | Normal | Preview hunk inline |
| `<leader>hb` | Normal | Show full git blame for current line |
| `<leader>tb` | Normal | Toggle inline blame on every line |

---

### File Navigation — Harpoon

> Harpoon lets you "pin" files and jump between them instantly without Telescope.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>a` | Normal | Add current file to Harpoon list |
| `<C-e>` | Normal | Toggle Harpoon quick menu |
| `<C-p>` | Normal | Jump to previous file in Harpoon list |
| `<C-n>` | Normal | Jump to next file in Harpoon list |
| `<leader>fl` | Normal | Open Harpoon list inside Telescope |

---

### Fuzzy Finding — Telescope

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ff` | Normal | Find files in project |
| `<leader>fg` | Normal | Live grep — search text across all files |
| `<leader>fb` | Normal | Browse open buffers |
| `<leader>fh` | Normal | Search Neovim help tags |

---

### Completion — nvim-cmp

> These work in **Insert** mode while a completion menu is open.  
> Note: `<C-e>` closes the completion menu here, but in Normal mode `<C-e>` opens the Harpoon menu — no conflict.

| Key | Mode | Action |
|-----|------|--------|
| `<Tab>` | Insert / Select | Select next completion item, or expand / jump through snippet |
| `<S-Tab>` | Insert / Select | Select previous item, or jump snippet backward |
| `<CR>` | Insert | Confirm selection (only if you explicitly highlighted an item) |
| `<C-Space>` | Insert | Force-open the completion menu |
| `<C-e>` | Insert | Close / abort the completion menu |
| `<C-b>` | Insert | Scroll documentation popup up |
| `<C-f>` | Insert | Scroll documentation popup down |

---

### Surround — nvim-surround

> Surround text with brackets, quotes, tags, or any character pair.

| Key | Mode | Action |
|-----|------|--------|
| `ys<motion><char>` | Normal | **Add** surround — e.g. `ysiw"` wraps word in `"..."` |
| `cs<old><new>` | Normal | **Change** surround — e.g. `cs"'` changes `"` to `'` |
| `ds<char>` | Normal | **Delete** surround — e.g. `ds"` removes surrounding `"` |
| `S<char>` | Visual | Surround the visual selection |

**Examples:**
```
ysiw"     →  hello  becomes  "hello"
ysa("     →  (foo)  becomes  ("foo")
cs"'      →  "hi"   becomes  'hi'
ds"       →  "bye"  becomes  bye
Vt        →  (visual line) becomes <t>...</t>
```

---

## Built-in Neovim Keybindings

---

### Navigation — Basic (learn these first)

These are the foundation. Master these before anything else.

| Key | Action |
|-----|--------|
| `h` `j` `k` `l` | Move left / down / up / right |
| `w` | Jump forward to start of next word |
| `b` | Jump backward to start of previous word |
| `e` | Jump to end of current word |
| `0` | Go to start of line (column 0) |
| `^` | Go to first non-blank character of line |
| `$` | Go to end of line |
| `gg` | Go to top of file |
| `G` | Go to bottom of file |
| `:<n>` | Go to line number (e.g. `:42`) |
| `i` | Enter Insert mode before cursor |
| `a` | Enter Insert mode after cursor |
| `o` | Open new line below and enter Insert mode |
| `O` | Open new line above and enter Insert mode |
| `I` | Enter Insert mode at start of line |
| `A` | Enter Insert mode at end of line |
| `Esc` | Return to Normal mode |
| `dd` | Delete (cut) current line |
| `yy` | Yank (copy) current line |
| `p` | Paste after cursor |
| `P` | Paste before cursor |
| `u` | Undo |
| `<C-r>` | Redo |
| `/` | Search forward — type pattern, press `Enter` |
| `?` | Search backward |
| `n` | Jump to next search match |
| `N` | Jump to previous search match |
| `:w` | Save file |
| `:q` | Quit |
| `:wq` | Save and quit |
| `:q!` | Quit without saving |

---

### Navigation — Intermediate

Once basics feel natural, add these to move much faster.

| Key | Action |
|-----|--------|
| `<C-u>` | Scroll half a page up |
| `<C-d>` | Scroll half a page down |
| `<C-f>` | Scroll full page forward (down) |
| `<C-b>` | Scroll full page backward (up) |
| `zz` | Center the screen on the cursor |
| `zt` | Scroll so cursor is at the top |
| `zb` | Scroll so cursor is at the bottom |
| `{` | Jump to previous blank line (paragraph up) |
| `}` | Jump to next blank line (paragraph down) |
| `*` | Search for the word under cursor (forward) |
| `#` | Search for the word under cursor (backward) |
| `%` | Jump to matching bracket / paren / brace |
| `f<char>` | Jump forward to next occurrence of `<char>` on the line |
| `F<char>` | Jump backward to `<char>` on the line |
| `t<char>` | Jump forward to just before `<char>` |
| `T<char>` | Jump backward to just after `<char>` |
| `;` | Repeat the last `f/F/t/T` forward |
| `,` | Repeat the last `f/F/t/T` backward |
| `ge` | Jump to end of previous word |
| `W` `B` `E` | Same as `w/b/e` but ignore punctuation (WORD) |
| `(` `)` | Jump backward / forward one sentence |
| `[[` `]]` | Jump to previous / next function / section |
| `.` | Repeat the last change |
| `~` | Toggle case of character under cursor |
| `>>`  `<<` | Indent / un-indent current line |
| `J` | Join current line with the line below |

---

### Navigation — Advanced

These separate experienced users from beginners.

| Key | Action |
|-----|--------|
| `<C-o>` | Jump back in the jump list (previous cursor positions) |
| `<C-i>` | Jump forward in the jump list |
| `m<letter>` | Set a mark at the cursor (e.g. `ma` sets mark `a`) |
| `'<letter>` | Jump to marked line (e.g. `'a`) |
| `` `<letter> `` | Jump to exact mark position |
| `''` | Jump back to the line you were on before the last jump |
| ` `` ` | Jump back to the exact position before the last jump |
| `gf` | Open the file whose name is under the cursor |
| `<C-^>` | Switch to the alternate (previously edited) file |
| `"<letter>` | Select a register — prefix yank/delete/paste (e.g. `"ayy` yanks into register `a`) |
| `"<letter>p` | Paste from a named register (e.g. `"ap`) |
| `"0p` | Paste from yank register (always the last `y`, never overwritten by `d`) |
| `"+y` / `"+p` | Yank to / paste from system clipboard |
| `q<letter>` | Record a macro into register (e.g. `qa` starts recording into `a`) |
| `q` | Stop recording macro |
| `@<letter>` | Play a macro (e.g. `@a`) |
| `@@` | Replay last macro |
| `5@a` | Replay macro `a` five times |
| `:g/pattern/d` | Delete every line matching a pattern |
| `:g/pattern/norm @a` | Run macro on every line matching a pattern |
| `gv` | Reselect the previous visual selection |
| `<C-w>o` | Close all windows except the current one |
| `<C-w>=` | Equalize all window sizes |

---

### Selecting Lines and Code Blocks

This is how you select, copy, and delete whole lines or entire blocks of code.

#### Selecting Whole Lines

| Key sequence | What it does |
|-------------|--------------|
| `V` | Select the current line in line-visual mode |
| `Vj` or `Vk` | Extend the selection one line down or up |
| `V5j` | Select 5 lines downward |
| `VG` | Select from current line to bottom of file |
| `ggVG` | Select entire file |

After selecting with `V`:
- `d` — **delete** selected lines
- `y` — **copy** selected lines
- `c` — **cut** and enter insert mode
- `>` / `<` — indent / un-indent
- `p` (after `y`) — paste the copied lines anywhere

#### Selecting Code Blocks (by bracket/brace)

| Key sequence | What it does |
|-------------|--------------|
| `vi{` | Select everything **inside** `{ }` (function body, object literal) |
| `va{` | Select `{ }` block **including** the braces |
| `vi(` | Select everything inside `( )` |
| `va(` | Select `( )` including the parens |
| `vi[` | Select everything inside `[ ]` |
| `va[` | Select `[ ]` including brackets |
| `vit` | Select inside an HTML/XML tag |
| `vat` | Select around an HTML/XML tag |

#### Selecting Paragraphs and Functions

| Key sequence | What it does |
|-------------|--------------|
| `vip` | Select **inner paragraph** (contiguous block of non-blank lines) |
| `vap` | Select **around paragraph** (including surrounding blank lines) |
| `dip` | Delete the paragraph your cursor is inside |
| `yap` | Copy the whole paragraph (including surrounding blank lines) |

#### Practical Copy-Paste Workflows

```
-- Copy a whole function body:
1. Place cursor anywhere inside the { }
2. yi{   →  yank everything inside the braces
3. Move to destination, press p

-- Copy the entire function including its signature:
1. Place cursor on the opening { of the function body
2. V       →  start line selection
3. %       →  jump to matching closing } (selects whole function body)
4. y       →  yank
5. p       →  paste
(Note: % finds the nearest bracket — cursor must be on { not on the function keyword)

-- Delete a whole block and re-type it:
1. Place cursor inside { }
2. ci{     →  delete contents and enter Insert mode

-- Duplicate a paragraph:
1. yap     →  yank paragraph
2. }       →  jump past it
3. p       →  paste

-- Select then delete lines 10-20:
:10,20d    (command mode — fastest way)
-- or visually:
:10        →  go to line 10  (or 10G in normal mode)
V          →  start visual
20G        →  jump to line 20 (extends selection)
d          →  delete
-- or count-based:
10G        →  go to line 10
V10j       →  select 10 lines down
d          →  delete
```

#### Column / Block Selection (Visual-Block)

| Key | Action |
|-----|--------|
| `<C-v>` | Enter Visual-Block mode (select a rectangular column) |
| `<C-v>jj$` | Select to end of multiple lines at once |
| `<C-v>I<text>Esc` | Insert `<text>` at the start of every selected line |
| `<C-v>A<text>Esc` | Append `<text>` at the end of every selected line |
| `<C-v>d` | Delete a column of characters |

---

### Text Objects — The Key to Fast Editing

Text objects are used after an operator (`d`, `y`, `c`, `v`).  
**`i`** = **inner** (just the content), **`a`** = **around** (content + delimiters).

| Object | Inner (`i`) | Around (`a`) |
|--------|------------|-------------|
| `w` | word | word + surrounding space |
| `W` | WORD (incl. punctuation) | WORD + space |
| `s` | sentence | sentence + space |
| `p` | paragraph | paragraph + blank lines |
| `"` | inside `"..."` | including the `"` |
| `'` | inside `'...'` | including the `'` |
| `` ` `` | inside `` `...` `` | including the backticks |
| `(` or `)` | inside `(...)` | including parens |
| `{` or `}` | inside `{...}` | including braces |
| `[` or `]` | inside `[...]` | including brackets |
| `<` or `>` | inside `<...>` | including angle brackets |
| `t` | inside HTML tag | including the tags |

**Examples:**
```
diw   →  delete word under cursor
ciw   →  change word (delete + insert mode)
yi"   →  copy everything inside quotes
da(   →  delete the entire ( ) including parens
ci{   →  delete function body, enter insert mode
vap   →  visually select the whole paragraph
dt"   →  delete from cursor to (not including) next "
```

---

### Editing

| Key | Action |
|-----|--------|
| `x` | Delete character under cursor |
| `X` | Delete character before cursor |
| `D` | Delete from cursor to end of line |
| `C` | Change from cursor to end of line |
| `r<char>` | Replace single character |
| `R` | Enter Replace mode (overwrite characters) |
| `s` | Delete character and enter Insert mode |
| `S` | Delete entire line and enter Insert mode |
| `cc` | Delete current line and enter Insert mode |
| `gu<motion>` | Convert to lowercase (e.g. `guiw`) |
| `gU<motion>` | Convert to uppercase (e.g. `gUiw`) |
| `g~<motion>` | Toggle case |
| `=<motion>` | Auto-indent |
| `==` | Auto-indent current line |

---

### Search & Replace

| Key / Command | Action |
|--------------|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` / `N` | Next / previous match |
| `*` | Search word under cursor (forward) |
| `#` | Search word under cursor (backward) |
| `:noh` | Clear search highlight |
| `:%s/old/new/g` | Replace all occurrences in file |
| `:%s/old/new/gc` | Replace all with confirmation prompt |
| `:s/old/new/g` | Replace on current line only |
| `:10,20s/old/new/g` | Replace in lines 10–20 |
| `:%s/\<word\>/new/g` | Replace whole word only (not partial matches) |

---

### Marks & Registers

| Key | Action |
|-----|--------|
| `m<a-z>` | Set a local mark (e.g. `ma`) |
| `m<A-Z>` | Set a global mark (persists across files) |
| `'<letter>` | Jump to marked line |
| `` `<letter> `` | Jump to exact mark position |
| `:marks` | List all marks |
| `"<letter>y` | Yank into named register |
| `"<letter>p` | Paste from named register |
| `"0p` | Paste last yank (not overwritten by delete) |
| `"+y` | Yank to system clipboard |
| `"+p` | Paste from system clipboard |
| `:registers` | Show all register contents |

---

### Folds

| Key | Action |
|-----|--------|
| `za` | Toggle fold under cursor |
| `zo` | Open fold |
| `zc` | Close fold |
| `zR` | Open all folds in file |
| `zM` | Close all folds in file |
| `zr` | Open one fold level |
| `zm` | Close one fold level |

---

### Visual Mode

| Key | Action |
|-----|--------|
| `v` | Character-wise visual mode |
| `V` | Line-wise visual mode |
| `<C-v>` | Block-wise (column) visual mode |
| `gv` | Reselect previous selection |
| `o` | Move to other end of selection |
| `d` | Delete selection |
| `y` | Copy (yank) selection |
| `c` | Change (delete + insert) |
| `>` / `<` | Indent / un-indent |
| `~` | Toggle case of selection |
| `gu` / `gU` | Lowercase / uppercase selection |
| `J` | Join selected lines |
| `=` | Auto-indent selection |

---

### Insert Mode

| Key | Action |
|-----|--------|
| `Esc` or `<C-c>` | Exit Insert mode |
| `<C-w>` | Delete word before cursor |
| `<C-u>` | Delete from cursor to start of line |
| `<C-h>` | Delete character before cursor (same as Backspace) |
| `<C-t>` | Indent current line |
| `<C-d>` | Un-indent current line |
| `<C-r><register>` | Paste from a register (e.g. `<C-r>"` pastes default register) |
| `<C-a>` | Insert the last inserted text again |

---

### Command Mode

| Command | Action |
|---------|--------|
| `:w` | Save |
| `:wa` | Save all open buffers |
| `:q` | Quit |
| `:qa` | Quit all |
| `:q!` | Force quit without saving |
| `:wq` or `ZZ` | Save and quit |
| `:e <file>` | Open file |
| `:r <file>` | Insert file contents below cursor |
| `:bn` / `:bp` | Next / previous buffer |
| `:bd` | Delete (close) current buffer |
| `:ls` | List all open buffers |
| `:split` / `:sp` | Split window horizontally |
| `:vsplit` / `:vsp` | Split window vertically |
| `:tabnew` | Open a new tab |
| `:tabclose` | Close current tab |
| `:.!<cmd>` | Replace current line with shell command output |
| `:sort` | Sort selected lines |
| `:noh` | Clear search highlights |
| `:checkhealth` | Run Neovim health checks |

---

### Windows & Splits

| Key | Action |
|-----|--------|
| `<C-w>h` | Move to left window |
| `<C-w>j` | Move to window below |
| `<C-w>k` | Move to window above |
| `<C-w>l` | Move to right window |
| `<C-w>w` | Cycle to next window |
| `<C-w>s` | Split horizontally |
| `<C-w>v` | Split vertically |
| `<C-w>c` | Close current window |
| `<C-w>o` | Close all other windows |
| `<C-w>=` | Equalize window sizes |
| `<C-w>+` / `<C-w>-` | Increase / decrease height |
| `<C-w>>` / `<C-w><` | Increase / decrease width |

---

### Tabs

| Key / Command | Action |
|--------------|--------|
| `:tabnew` | Open new tab |
| `:tabnew <file>` | Open file in new tab |
| `gt` | Go to next tab |
| `gT` | Go to previous tab |
| `<n>gt` | Go to tab number `n` (e.g. `2gt`) |
| `:tabclose` | Close current tab |
| `:tabonly` | Close all other tabs |
| `:tabs` | List all tabs |
