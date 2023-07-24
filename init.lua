vim.cmd("set runtimepath^=~/.vim runtimepath+=~/.vim/after")
vim.cmd("let &packpath = &runtimepath")
vim.cmd("source ~/.vimrc")

require('telescope').load_extension('media_files')
require'telescope'.setup {
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      -- find command (defaults to `fd`)
      find_cmd = "rg"
    }
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags,  {})

local dropbox_root = "~/Dropbox"
local vault_path = dropbox_root .. "/notes/vimwiki"
local templates_path = vault_path .. "/templates"
require('telekasten').setup({
  home = vim.fn.expand(vault_path),
  daily = vim.fn.expand(vault_path .. "/diary"),
  dailies = vim.fn.expand(vault_path .. "/diary"),
  templates = vim.fn.expand(templates_path),
  template_new_note = vim.fn.expand(templates_path .. "/note.md"),
  template_new_daily = vim.fn.expand(templates_path .. "/diary.md"),
  image_subdir = vim.fn.expand(vault_path .. "/img"),
  tag_notation = "@tag",
})

vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zy", "<cmd>Telekasten yank_notelink<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zF", "<cmd>Telekasten find_friends<CR>")
vim.keymap.set("n", "<leader>zi", "<cmd>Telekasten preview_img<CR>")
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")
vim.keymap.set("n", "<leader>zt", "<cmd>Telekasten show_tags<CR>")
vim.keymap.set("n", "<leader>zp", "<cmd>Telekasten paste_img_and_link<CR>")
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")

local inka = require('inka')
inka.setup({
    inka_binary_path = '/opt/homebrew/bin/inka',
    inka_timeout = 10000,
})
vim.keymap.set('n', '<leader>zs', inka.collect_file, {})
