require("nvide.core").setup()

vim.g.tokyonight_italic_functions = true

-- vim.cmd[[colorscheme tokyonight]]
vim.cmd.colorscheme("tokyonight")

-- global statusbar
vim.opt.laststatus = 3

-- TODO: teste

vim.keymap.set("n", "<M-Up>", ":m .-2<CR>==", { noremap = true })
vim.keymap.set("n", "<M-Down>", ":m .+1<CR>==", { noremap = true })
vim.keymap.set("i", "<M-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true })
vim.keymap.set("i", "<M-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true })
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>==gv", { noremap = true })
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>==gv", { noremap = true })
-- utils.nnoremap("<M-Up>", ":m .-2<CR>==")
-- utils.nnoremap("<M-Down>", ":m .+1<CR>==")
-- utils.inoremap("<M-Up>", "<Esc>:m .-2<CR>==gi")
-- utils.inoremap("<M-Down>", "<Esc>:m .+1<CR>==gi")
-- utils.vnoremap("<M-Up>", ":m '<-2<CR>==gv")
-- utils.vnoremap("<M-Down>", ":m '>+1<CR>==gv")

-- set tab width
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true

vim.opt.hidden = true
vim.opt.title = true

-- global statusbar
vim.opt.laststatus = 3

vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.encoding = "utf-8"
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

vim.keymap.set("n", "<leader>go", function() require("lazy.util").float_term("lazygit") end, {desc = "Open Lazygit"})

-- fix tab width for some filetypes
vim.api.nvim_create_autocmd({"BufEnter"}, {
  pattern = {"*.tf", "*.lua"},
  callback = function()
    vim.bo.shiftwidth = 2
  end,
})
