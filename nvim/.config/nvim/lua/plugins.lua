local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then
        vim.cmd("packadd " .. plugin)
    end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(
    function(use)
        -- Packer can manage itself as an optional plugin
        use "wbthomason/packer.nvim"
        use "neoclide/coc.nvim"

        -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
        use {"neovim/nvim-lspconfig"}

        -- Telescope
        use {"nvim-lua/popup.nvim"}
        use {"nvim-lua/plenary.nvim"}
        use {"nvim-telescope/telescope.nvim"}

        -- Debugging
        use {"mfussenegger/nvim-dap"}

        -- Autocomplete
        use {"hrsh7th/nvim-compe"}
        use {"hrsh7th/vim-vsnip"}
        use {"rafamadriz/friendly-snippets"}

        -- Treesitter
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use {"windwp/nvim-ts-autotag"}
				use {"frazrepo/vim-rainbow"}	
        -- Explorer
        use "kyazdani42/nvim-tree.lua"
        -- TODO remove when open on dir is supported by nvimtree

        use {'lukas-reineke/indent-blankline.nvim',ranch = 'lua'}
        use {"lewis6991/gitsigns.nvim"}
        -- use {"liuchengxu/vim-which-key", opt = true}
        use {"folke/which-key.nvim"}
        use {"ChristianChiarulli/dashboard-nvim"}
        use {"windwp/nvim-autopairs"}
        use {"terrortylor/nvim-comment"}
        use {"kevinhwang91/nvim-bqf"}

        -- Color
        use {"christianchiarulli/nvcode-color-schemes.vim"}
        use {"norcalli/nvim-colorizer.lua"}

        -- Icons
        use {"kyazdani42/nvim-web-devicons"}

        -- Status Line and Bufferline
        use {"glepnir/galaxyline.nvim"}
        use {"romgrk/barbar.nvim"}

        require_plugin("nvim-lspconfig")
        require_plugin("lspsaga.nvim")
        require_plugin("nvim-lspinstall")
        require_plugin("friendly-snippets")
        require_plugin("popup.nvim")
        require_plugin("plenary.nvim")
        require_plugin("telescope.nvim")
        require_plugin("nvim-dap")
        require_plugin("nvim-compe")
        require_plugin("vim-vsnip")
        require_plugin("nvim-treesitter")
        require_plugin("nvim-ts-autotag")
        require_plugin("nvim-tree.lua")
        require_plugin("gitsigns.nvim")
        require_plugin("which-key.nvim")
        require_plugin("dashboard-nvim")
        require_plugin("nvim-autopairs")
        require_plugin("vim-rainbow")
        require_plugin("nvim-comment")
        require_plugin("nvim-bqf")
        require_plugin("nvcode-color-schemes.vim")
        require_plugin("nvim-web-devicons")
        require_plugin("galaxyline.nvim")
        require_plugin("barbar.nvim")
        require_plugin("nvim-colorizer.lua")
        require_plugin("coc")
    end
)
