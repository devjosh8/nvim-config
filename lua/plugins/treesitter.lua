return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      -- Zusätzliche Textobjects für Treesitter
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter").setup({

        -- Zu installierende Parser
        ensure_installed = {
          "lua",
          "vim",
          "vue",
          "vimdoc",
          "query",
          "python",
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "json",
          "yaml",
          "toml",
          "bash",
          "markdown",
          "markdown_inline",
          "rust",
          "go",
          "c",
          "cpp",
        },

        -- Alle Parser synchron installieren (nur für den ersten Start empfohlen)
        sync_install = false,

        -- Fehlende Parser beim Öffnen von Dateien automatisch installieren
        auto_install = true,

        -- Syntaxbasiertes Highlighting aktivieren
        highlight = {
          enable = true,

          -- Vim-eigenes Regex-Highlighting deaktivieren (empfohlen)
          additional_vim_regex_highlighting = false,
        },

        -- Einrückung auf Basis des Syntaxbaums
        indent = {
          enable = true,
        },

        -- Inkrementelle Selektion per Tastenkürzel
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection    = "<C-space>",
            node_incremental  = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental  = "<BS>",
          },
        },

      })
    end,
  },

  -- Textobjects als eigenständiges Plugin konfigurieren (nvim-treesitter v1.0+)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      })
    end,
  },
}
