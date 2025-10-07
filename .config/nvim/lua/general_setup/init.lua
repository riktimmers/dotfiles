require("general_setup.packer")
require("general_setup.set")
require("general_setup.remap")

vim.api.nvim_create_autocmd("BufEnter", { callback = function() vim.opt.formatoptions = vim.opt.formatoptions - {"c", "r", "o"} end, })
