
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      -- A list of parser names to install, or "all"
      ensure_installed = { "python", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "rust"},

      -- Install parsers synchronously
      sync_install = false,

      -- Auto-install missing parsers
      auto_install = true,

      -- Ignore parsers during installation
      ignore_install = { "javascript" },

      highlight = {
        enable = true, -- Enable highlight functionality

        -- Disable highlighting for specific parsers or conditions
        disable = { "c", "rust" },
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          return ok and stats and stats.size > max_filesize
        end,

        -- Enable syntax highlighting in addition to Treesitter
        additional_vim_regex_highlighting = false,
      },
    }
  end,
}

