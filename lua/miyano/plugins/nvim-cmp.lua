--================================================================
-- nvim-cmp.lua
--================================================================
-- lua/miyano/plugins/nvim-cmp.lua
-- created: 2023-09-09
-- Used for autocomplete in neovim
-- h: cmp_docs

local cmp_ui = {
  icons = true,
  lspkind_text = true,
  style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  -- selected_item_bg = "colored", -- colored / simple
}

local icons = require("miyano.utils.icons").vscode_icons

-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
  -- return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_style = cmp_ui.style

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",

  dependencies = {
    "hrsh7th/cmp-buffer",     -- source for text in buffer
    "hrsh7th/cmp-path",       -- source for file system paths
    "onsails/lspkind.nvim",
    "L3MON4D3/LuaSnip",       -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "L3MON4D3/LuaSnip",
    -- {
    --   "zbirenbaum/copilot-cmp",
    --   config = function()
    --     require("copilot_cmp").setup()
    --   end,
    -- },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    -- local lspkind = require("lspkind")

    -- lua format
    require("luasnip.loaders.from_lua").load()
    require("luasnip.loaders.from_lua").lazy_load({ paths = "./snippets/lua_snip" })

    -- load vs-code like snippets from plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets/vsc_snip" })

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      window = {
        completion = {
          side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
          -- winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
          -- winhighlight = "Normal:CmpNormal",
          scrollbar = false,
          border = border("CmpDocBorder"),
        },
        documentation = {
          border = border("CmpDocBorder"),
          winhighlight = "Normal:CmpPmenu,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
          -- winhighlight = "Normal:CmpDoc",
        },
      },
      -- view = {
      -- 	entries = "custom",
      -- },

      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<Esc>"] = cmp.mapping.abort(),    -- close completion window
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() and has_words_before() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
            -- elseif has_words_before() then
            -- 	cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 2 }, -- lsp
        { name = "copilot",  keyword_length = 2 }, -- lsp
        { name = "luasnip",  keyword_length = 2 }, -- snippets
        { name = "buffer",   keyword_length = 3 }, -- text within current buffer
        { name = "path" },                     -- file system paths
      }),

      -- configure lspkind for vs-code like icons
      formatting = {
        -- format = lspkind.cmp_format({
        -- 	maxwidth = 50,
        -- 	mode = "symbol_text",
        -- 	ellipsis_char = "...",
        --
        -- 	menu = {
        -- 		buffer = "[buf]",
        -- 		nvim_lsp = "[LSP]",
        -- 		nvim_lua = "[api]",
        -- 		copilot = "[copilot]",
        -- 		path = "[path]",
        -- 		luasnip = "[snip]",
        -- 	},
        -- }),
        format = function(entry, vim_item)
          --  Kind icons
          vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
          -- Source
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            copilot = "[copilot]",
            luasnip = "[LuaSnip]",
            buffer = "[Buffer]",
            path = "[path]",
          })[entry.source.name]
          return vim_item
        end,
      },
    })
  end,
}
