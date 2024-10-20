
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- buffer keymaps 
vim.keymap.set("n", "tk", vim.cmd.bnext)
vim.keymap.set("n", "tj", vim.cmd.bprev)
vim.keymap.set("n", "td", vim.cmd.bdelete)

-- vim.api.nvim_set_keymap("n", "ff", ":Telescope find_files<CR>", {noremap=true})
-- # If your telescope.lua is throwing 'no matching language server', rewrite the keybinds here like this:
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>")
vim.keymap.set('n', '<leader>fs', ":Telescope grep_string<CR>")

-- Trouble
vim.keymap.set('n', '<leader>tt', "<cmd>Trouble diagnostics focus<cr>", {silent = true})
vim.keymap.set('n', '<leader>ts', "<cmd>Trouble symbols<cr>", {silent = true, noremap = true})

-- # Terminal remap for back to normal mode 
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]],{noremap=true})


-- Normal-mode commands
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>==', opts)
vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>==', opts)

-- Visual-mode commands
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)

--Markdown-Preview 
vim.keymap.set("n", "<C-p>", vim.cmd.MarkdownPreviewToggle)
vim.g.mkdp_browser = 'qutebrowser'
vim.g.mkdp_theme = 'dark'


-- Html Live-server by nodejs
vim.keymap.set("n", "<C-l>", ":!live-server --browser=qutebrowser &<CR>")

--vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy line to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


