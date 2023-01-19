local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use("wbthomason/packer.nvim")
    -- 你的插件列表...
    --------------------- colorschemes --------------------
    -- tokyonight
    use("folke/tokyonight.nvim")
    -- OceanicNext
    use("mhartington/oceanic-next")
    -- gruvbox
    use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
    -- zephyr 暂时不推荐，详见上边解释
    -- use("glepnir/zephyr-nvim")
    -- nord
    use("shaunsingh/nord.nvim")
    -- onedark
    use("ful1e5/onedark.nvim")
    -- nightfox
    use("EdenEast/nightfox.nvim")
-------------------------------------------------------
------------资源管理器-----------------
    use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
-------------------------------------------------------
-----------状态栏bufferline------------
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine (新增)
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
--------------------------------------------
----------文件搜索telescope---------------
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
-------- telescope extensions
    use "LinArcX/telescope-env.nvim"
---------------------------------------------------------
-------- 封面dashboard
    use("glepnir/dashboard-nvim")
-------- project
    use("ahmedkhalf/project.nvim")
-------- 代码高亮 --------
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
----------------------------------
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig",} ----------------------------------------------------
--------- 代码补全 ------------------
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    use('SirVer/ultisnips')
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("quangnguyen30192/cmp-nvim-ultisnips")
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- ui
    use("onsails/lspkind-nvim")   
    use("tami5/lspsaga.nvim" )
        -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
end,
config = {
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end,
    },
    git = {
    cmd = 'git',
    default_url_format = 'git@github.com:%s',
    },
}
})

pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
