require('numb').setup{
  show_numbers = true, -- Enable 'number' for the window while peeking
  show_cursorline = false, -- Enable 'cursorline' for the window while peeking
  number_only = true, -- Peek only when the command is only a number instead of when it starts with a number
  centered_peeking = true, -- Peeked line will be centered relative to window
}

require('telescope').setup{
  pickers = {
    find_files = {
      theme = "dropdown",
      prompt_prefix="🔍",
      find_command = {
        "fd",
        "--type",
        "file",
        "--exclude",
        ".git",
        "--strip-cwd-prefix",
        "-e", "tex", "-e", "bib", "-e", "sty", "-e", "cls",
        "-e", "py", "-e", "cpp", "-e", "java",
        "-e", "js", "-e", "rust", "-e", "ipynb",
        "-e", "md", "-e", "wiki",
      }
    },
    live_grep = {
      theme = "dropdown",
      prompt_prefix="🔍",
    }
  },
  extensions = {
    file_browser = {
          theme = "ivy",
    }  
  }
}
require("telescope").load_extension "file_browser"


-- Setup nvim-cmp.
local cmp = require'cmp'
local luasnip = require'luasnip'

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
    snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
    },
    completion = {
        autocomplete = false, -- disable auto-completion.
    },
    mapping = {
      ['<C-k>'] = cmp.mapping(
          function(fallback)
              if luasnip.expandable() then
                luasnip.expand()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
          end, { "i", "s",
      }),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable,
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-n>'] = cmp.mapping(
          function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
        end, { "i", "s" }),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.menu = ({
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
            dictionary = "[Spell]",
            nvim_lsp = "[LSP]",
          })[entry.source.name]
          return vim_item
        end,
    },
    sources = {
        { name = 'luasnip', index=1 },
        { name = 'path', index=1 },
        { name = 'buffer', index=1 },
        { name = 'nvim_lsp', index=1},
        { name = 'dictionary', index=2},
    },
    documentation = {
       border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
})



local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_installer = require "nvim-lsp-installer"
lsp_installer.on_server_ready(function(server)
    local opts = {
        capabilities=capabilities,
    }
    server:setup(opts)
end)


require("cmp_dictionary").setup({
    dic = {
        ["txt,tex,markdown,pandoc"] = { "/usr/share/dict/american-english" },
    },
    exact = 2,
    first_case_insensitive = false,
})
