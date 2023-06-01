require('plugins.config.onedark')

vim.cmd.colorscheme("onedark")
vim.cmd.highlight({ "Error", "guibg=red" })
vim.cmd.highlight({ "link", "Warning", "Error" })


