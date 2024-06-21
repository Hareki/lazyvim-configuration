-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.g.mapleader = " "

local map = vim.keymap.set

map("i", "jk", "<Esc>", { noremap = true, desc = "Map jk to Esc in insert mode", silent = true })

map({ "n", "v" }, "<A-u>", "<C-u>zz", { noremap = true, desc = "Scroll up and center", silent = true })
map({ "n", "v" }, "<A-d>", "<C-d>zz", { noremap = true, desc = "Scroll down and center", silent = true })

map("x", "p", '"_dP', { noremap = true, desc = "Paste without overwriting register", silent = true })
map("x", "x", '"0d', { noremap = true, desc = "Cut to register 0", silent = true })
map({ "x" }, "<leader>y", '"+y', { noremap = true, desc = "Yank to system clipboard", silent = true })
map({ "n", "x" }, "<leader>p", '"+p', { noremap = true, desc = "Paste from system clipboard", silent = true })

map({ "n", "v" }, "<A-s>", ":w<CR>", { noremap = true, desc = "Save file", silent = true })
