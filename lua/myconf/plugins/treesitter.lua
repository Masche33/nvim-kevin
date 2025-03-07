-- Configuration for nvim-treesitter, providing better syntax highlighting, code navigation, and other features.

return {
   "nvim-treesitter/nvim-treesitter",
   event = { "BufReadPre", "BufNewFile" },
   build = ":TSUpdate",
   dependencies = {
      "windwp/nvim-ts-autotag",
   },
   config = function()
      -- import nvim-treesitter plugin
      local treesitter = require("nvim-treesitter.configs")

      -- configure treesitter
      treesitter.setup({ -- enable syntax highlighting
         highlight = {
            enable = true,
         },
         -- enable indentation
         indent = { enable = false },
         -- enable autotagging (w/ nvim-ts-autotag plugin)
         autotag = {
            enable = true,
         },
         -- ensure these language parsers are installed
         ensure_installed = {
            "json",
            "javascript",
            "typescript",
            "tsx",
            "yaml",
            "html",
            "css",
            "prisma",
            "markdown",
            "markdown_inline",
            "svelte",
            "graphql",
            "bash",
            "lua",
            "vim",
            "dockerfile",
            "gitignore",
            "query",
            "vimdoc",
            "java"
         },
         incremental_selection = {
            enable = true,
            keymaps = {
               init_selection = "<C-space>",
               node_incremental = "<C-space>",
               scope_incremental = false,
               node_decremental = "<bs>",
            },
         },
      })

      vim.api.nvim_create_augroup("MatchBrackets", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
         group = "MatchBrackets",
         pattern = { "cpp", "html", "xml" },
         callback = function()
            vim.opt_local.matchpairs:append("<:>")
         end,
      })
   end,
}
