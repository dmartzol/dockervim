  -- This file can be loaded by calling `lua require('plugins')` from your init.vim
_ = vim.cmd [[packadd packer.nvim]]

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use 'nvim-lua/popup.nvim'

    use { "folke/which-key.nvim" }

    use 'AndrewRadev/splitjoin.vim' -- Switch between single-line and multiline forms of code

    ---- plugin to show function signature as I type
    use 'ray-x/lsp_signature.nvim'

    ---- plugin to reload lua config
    use 'famiu/nvim-reload'

    ---- plugin to manage  marks/bookmarks
    use {'chentau/marks.nvim', commit = "8e80a20a170434bc77decc97bc4364c3ba848925"}

    ---- plugin to display hidden characters easily
    use 'tjdevries/cyclist.vim'

    ---- telescope requirements...
    use 'nvim-telescope/telescope-file-browser.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    ---- telescope requirements...

    ---- color themes
    use 'rakr/vim-one'
    use 'navarasu/onedark.nvim'

    ---- Status bar
    use {'nvim-lualine/lualine.nvim', commit = '619ededcff79e33a7e0ea677881dd07957449f9d'}
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }


    ---- Navigation
    ----use 'ggandor/lightspeed.nvim'     -- lightspeed to move faster
    ----use 'unblevable/quick-scope'      -- jump to any word in the current line
    --use {
        --'phaazon/hop.nvim',
        --branch = 'v1', -- optional but strongly recommended
    --}

    ---- indentation lines
    use "lukas-reineke/indent-blankline.nvim"

    ---- go language support
    use {'fatih/vim-go',  run = ':GoInstallBinaries' }

    ---- native LSP server
    use 'neovim/nvim-lspconfig'

    ----" commenting code
    use 'preservim/nerdcommenter'

    ---- automatic closing of quotes, parenthesis, etc
    use 'Raimondi/delimitMate'

    ---- git plugin
    --use 'tpope/vim-fugitive'

    ---- shows current git branch
    use 'itchyny/vim-gitbranch'

    -- LSP autocompletion...
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use "onsails/lspkind-nvim"
    -- For ultisnips users.
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    --use "L3MON4D3/LuaSnip" --snippet engine
    use 'SirVer/ultisnips'
    -- LSP autocompletion...

    -- shows a git diff in the sign column
    use {
        'lewis6991/gitsigns.nvim',
        commit = '32763586ab9e2c0ec477e165bec5b382d0a1c266',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    ---- Pretty colors
    use {'norcalli/nvim-colorizer.lua', commit = '36c610a9717cc9ec426a07c8e6bf3b3abcb139d6'}

    ---- dap debugging
    --use {'mfussenegger/nvim-dap', commit = 'a9c49a5f9dc21e4e9359c2b7fe30ed3a2f65cd9a'}

    ---- toggle terminal mode
    use {"akinsho/toggleterm.nvim", commit = '4aa4f40c350dbd17bd2035abbbc0e3a23f59e747'}

    ---- switch projects
    --use { 'ahmedkhalf/project.nvim', commit = '612443b27f5feda45ea478bd6ddc8f95d4ec7b77' }

    ---- buffer list
    use { 'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons' }

    --use {
      --"NTBBloodbath/rest.nvim",
      --requires = { "nvim-lua/plenary.nvim" },
      --commit = 'd902996de965d5d491f122e69ba9d03f9c673eb0',
      --config = function()
        --require("rest-nvim").setup({
          ---- Open request results in a horizontal split
          --result_split_horizontal = false,
          ---- Keep the http file buffer above|left when split horizontal|vertical
          --result_split_in_place = false,
          ---- Skip SSL verification, useful for unknown certificates
          --skip_ssl_verification = false,
          ---- Highlight request on run
          --highlight = {
            --enabled = true,
            --timeout = 150,
          --},
          --result = {
            ---- toggle showing URL, HTTP info, headers at top the of result window
            --show_url = true,
            --show_http_info = true,
            --show_headers = true,
          --},
          ---- Jump to request line on run
          --jump_to_request = false,
          --env_file = '.env',
          --custom_dynamic_variables = {},
          --yank_dry_run = true,
        --})
      --end
    --}

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
