-- set x
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.guicursor = "n-v-c-sm:ver25,i-ci-ve:ver25,r-cr-o:hor20"
vim.opt.termguicolors = true
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 0
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = "tab:>-"
vim.opt.textwidth = 1999
vim.opt.wrap = false
vim.opt.foldlevel = 99
vim.opt.mouse = ""

-- let g:x
vim.g.mapleader = " "
vim.g.zig_fmt_autosave = false

-- splitting stuff
vim.cmd[[
function! WinMove(key)
let t:curwin = winnr()
exec "wincmd ".a:key
if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
        wincmd v
    else
        wincmd s
    endif
    exec "wincmd ".a:key
endif
endfunction

nnoremap <silent> <leader>l :call WinMove('l')<CR>
nnoremap <silent> <leader>k :call WinMove('k')<CR>
nnoremap <silent> <leader>j :call WinMove('j')<CR>
nnoremap <silent> <leader>h :call WinMove('h')<CR>
nnoremap <silent> <leader>L :wincmd L<CR>
nnoremap <silent> <leader>K :wincmd K<CR>
nnoremap <silent> <leader>J :wincmd J<CR>
nnoremap <silent> <leader>H :wincmd H<CR>
nnoremap <silent> <left>  :3wincmd <<cr>
nnoremap <silent> <right> :3wincmd ><cr>
nnoremap <silent> <up>    :3wincmd +<cr>
nnoremap <silent> <down>  :3wincmd -<cr>
]]

-- spell checking
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.keymap.set("n", "<leader>sf", "[sz=1<CR><CR>") -- fast misspell fix
vim.keymap.set("n", "<leader>slf", "[sz=") -- list corrections

-- clipboard integration
vim.keymap.set("", "<leader>d", '"+d')
vim.keymap.set("", "<leader>D", '"+D')

vim.keymap.set("", "<leader>p", '"+p')
vim.keymap.set("", "<leader>P", '"+P')

vim.keymap.set("", "<leader>y", '"+y')
vim.keymap.set("", "<leader>Y", '"+Y')


-- vim.keymap.set({"", "i"}, "<F1>", "") -- fuck F1 -- should be overwritten by dap
vim.keymap.set("", "q:", function() print("q:") end) -- fuck command-line window 

-- alt-a goes to alternate buffer
vim.keymap.set({"n", "i"}, "<M-a>", function() 
    if pcall(function() vim.cmd(":e #") end) then
        vim.cmd("stopinsert")
    end
end)

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins") -- setup plugins
