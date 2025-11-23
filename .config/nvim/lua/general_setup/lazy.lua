-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"


require('lazy').setup({
	 {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	-- or                            , branch = '0.1.x',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
	},

	 { "ellisonleao/gruvbox.nvim" },
  { "folke/tokyonight.nvim"},


	 {
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
   	},

	{ 'ThePrimeagen/harpoon' },

	{ 'tpope/vim-fugitive' },

    -- Use release branch (recommend)
   --{'neoclide/coc.nvim', branch = 'release'},
  
  {
    'nvim-lualine/lualine.nvim',
   dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },

   {'nvim-tree/nvim-web-devicons'},

   {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    -- OR 'ibhagwan/fzf-lua',
    -- OR 'folke/snacks.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function ()
    require"octo".setup(
      {
        mappings = {
        review_thread = {
          close_review_tab = { lhs = "<C-q>", desc = "close review tab" },
        },
        submit_win = {
          close_review_tab = { lhs = "<C-q>", desc = "close review tab", mode = { "n", "i" } },
        },
        review_diff = {
          close_review_tab = { lhs = "<C-q>", desc = "close review tab" },
        },
        file_panel = {
           close_review_tab = { lhs = "<C-q>", desc = "close review tab" },
        },
        },
      }
    )
  end
  },

   {"akinsho/toggleterm.nvim", 
      config = function()
        require("toggleterm").setup({
          open_mapping = [[<leader>t]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
          direction = 'horizontal',
          size = 20
        })
      end
    },

  {'neoclide/coc.nvim', branch = 'release'},

  {'mfussenegger/nvim-dap'
    -- https://github.com/vadimcn/codelldb download the a release and unzip the .vsix
   },

  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },


})

