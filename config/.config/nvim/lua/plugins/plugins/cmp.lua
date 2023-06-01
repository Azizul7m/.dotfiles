
return {
      "hrsh7th/nvim-cmp",
      keys = { ":", "/", "?" }, -- lazy load cmp on more keys along with insert mode
      event = "InsertEnter",
      dependencies = {
        "onsails/lspkind-nvim",
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        "hrsh7th/cmp-emoji",
          --snippet
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        "rafamadriz/friendly-snippets",
      },
}
