return{
    'akinsho/bufferline.nvim', 
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts= function()
      require("bufferline").setup{}
    end,
}

