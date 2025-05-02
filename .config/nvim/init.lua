local colors = {
  black = "#000507",
  blue = "#023550",
  cyan = "#02899e",
  green = "#93d0cb",
  orange = "#d45500",
  red = "#d9483b",
  white = "#a0cecb",
  yellow = "#f2c12e",
}

---
--- Vim
---

-- Enble Vim settings.
vim.cmd([[
set autoindent
set background=dark
set cc=100
set expandtab
set incsearch
set list
set listchars=tab:»·,trail:·
set ls=2
set modeline
set nowrap
set number
set shiftwidth=2
set smartcase
set softtabstop=2
set statusline+=\ %f%=%l/%L\
set t_Co=256
set tabstop=2
set textwidth=100
]])

-- Remove trailing whitespace on save.
vim.api.nvim_create_autocmd("BufWritePre", {
  command = "%s/\\s\\+$//e",
  pattern = "*",
})

-- Adjust some highlight colors.
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "Visual", { ctermbg = 5, bg = "none" })

---
--- Lazy
---

-- Settings for lazy.
local lazyDataPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazyOpts = {}
local lazyPlugins = {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()

      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },

        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
        }),

        sorting = defaults.sorting,

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),

        window = {
          completion = cmp.config.window.bordered(),
        },
      }
    end
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "|" }
    }
  },
  { "mfussenegger/nvim-lint" },
  { "neovim/nvim-lspconfig" },
  {
    "numToStr/Comment.nvim",
    lazy = false,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "stevearc/conform.nvim" },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "yetone/avante.nvim",
    build = "make",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
		},
    event = "VeryLazy",
    opts = {
      ollama = {
        -- model = "codellama:7b-code",
        model = "mistral",
        -- num_ctx = 512,
        -- temperature = 0,
      },
      provider = "ollama",
    },
    version = false,
  },
}

-- Load the Lazy plugin manager.
if not vim.loop.fs_stat(lazyDataPath .. "README.md") then
  -- Lazy needs to be downloaded.
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazyDataPath,
  })
end
vim.opt.rtp:prepend(lazyDataPath)
require("lazy").setup(lazyPlugins, lazyOpts)

---
--- Plugins
---

--- Set-up trouble.

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)

--- Set-up LSP.

local lsp = require("lspconfig")
lsp.gopls.setup({})
lsp.jedi_language_server.setup({})

--- Set-up conform.

require("conform").setup({
  formatters_by_ft = {
    erlang = {"erlfmt"},
    go = {"gofmt"},
    python = {"black", "isort"},
  },
  format_on_save = function(buf)
    if  vim.b[buf].disable_autoformat or vim.g.disable_autoformat then
      return
    end
    return { lsp_fallback = true, timeout_ms = 500 }
  end,
})

vim.api.nvim_create_user_command("FormatOff", function(args)
  if args.bang then
    -- FormatOff! will disable formatting just for this buffer.
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  bang = true,
  desc = "Disable autoformatting-on-save."
})
vim.api.nvim_create_user_command("FormatOn", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Enable autoformatting-on-save."
})

--- Set-up nvim-lint.

require("lint").linters_by_ft = {
  python = {"flake8"},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

--- Set-up comment.

require("Comment").setup()

--- Set-up nvim-treesitter.

require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true
  }
})

--- Set-up nvim-treesitter-context.

require("treesitter-context").setup()

--- Set-up lualine.

-- Override a theme.
local customTheme = require("lualine.themes.gruvbox")
customTheme = {
	normal = {
		a = {bg = colors.blue, fg = colors.black, gui = "bold"},
		b = {bg = colors.black, fg = colors.white},
		c = {bg = colors.black, fg = colors.white}
	},
	insert = {
		a = {bg = colors.green, fg = colors.black, gui = "bold"},
		b = {bg = colors.black, fg = colors.white},
		c = {bg = colors.black, fg = colors.white}
	},
	visual = {
		a = {bg = colors.yellow, fg = colors.black, gui = "bold"},
		b = {bg = colors.black, fg = colors.white},
		c = {bg = colors.black, fg = colors.white}
	},
	replace = {
		a = {bg = colors.red, fg = colors.black, gui = "bold"},
		b = {bg = colors.black, fg = colors.white},
		c = {bg = colors.black, fg = colors.white}
	},
	command = {
		a = {bg = colors.cyan, fg = colors.black, gui = "bold"},
		b = {bg = colors.black, fg = colors.white},
		c = {bg = colors.black, fg = colors.white}
	},
	inactive = {
		a = {bg = colors.black, fg = colors.white, gui = "bold"},
		b = {bg = colors.black, fg = colors.white},
		c = {bg = colors.black, fg = colors.white}
	},
}
require("lualine").setup({
  options = {
    theme = customTheme
  }
})

-- Set-up colorscheme.

-- Override a theme.
require("cyberdream").setup({
  transparent = true,
  terminal_colors = true,
  theme = {
    colors = {
      bg = colors.black,
      bgAlt = colors.blue,
      bgHighlight = colors.blue,
      blue = colors.white,
      cyan = colors.white,
      fg = colors.white,
      green = colors.red,
      grey = colors.blue,
      magenta = colors.orange,
      orange = colors.orange,
      pink = colors.red,
      purple = colors.white,
      red = colors.yellow,
      yellow = colors.orange,
    }
  }
})
vim.cmd([[colorscheme cyberdream]])
