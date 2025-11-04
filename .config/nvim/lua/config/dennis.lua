-- my mappings, based on mappings.lua

local function map(m, k, v)
	vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

-- set leader
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "


map("n", "<leader>s", ":r!/Users/dennisfj/notes/insert_image %:p<CR>") --move recent screenshot to figures folder
map("n", "<leader>c", ":r!/Users/dennisfj/notes/insert_image %:p clipboard<CR>") --same but using clipboard instead of screenshot
map("n", "<leader>l", ":!/Users/dennisfj/notes/contents ") --list contents of [485, 413]


-- misc
map("n", "<leader>w", ":w<CR>") --write but one less key
map("n", "<leader>d", ":w ") --duplicate to new name
map("n", "<leader>x", "<cmd>!chmod +x %<CR>") --make a file executable
map("n", "<leader>mv", ":!mv % ") --move a file to a new dir
map("n", "<leader>R", ":so %<CR>") --reload neovim config
map("n", "<leader>u", ':silent !xdg-open "<cWORD>" &<CR>') --open a url under cursor
map("v", "<leader>i", "=gv") --auto indent
map("n", "<leader>W", ":set wrap!<CR>") --toggle wrap


map("n", "<leader>H", function() --toggle htop in term
    _G.htop:toggle()
end)



map("n", "<leader>nn", function() --toggle relative vs absolute line numbers
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
		vim.wo.number = true
	else
		vim.wo.relativenumber = true
	end
end)
