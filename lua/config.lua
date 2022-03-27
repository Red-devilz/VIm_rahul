require('numb').setup{
  show_numbers = true, -- Enable 'number' for the window while peeking
  show_cursorline = false, -- Enable 'cursorline' for the window while peeking
  number_only = true, -- Peek only when the command is only a number instead of when it starts with a number
  centered_peeking = true, -- Peeked line will be centered relative to window
}

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
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
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

require("telescope").load_extension "file_browser"


-- Setup nvim-cmp.
local cmp = require'cmp'

require("luasnip/loaders/from_vscode").lazy_load()
local luasnip = require'luasnip'

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
            omni = "[Omni]",
            path = "[Path]",
            dictionary = "[Spell]",
            nvim_lsp = "[LSP]",
          })[entry.source.name]
          return vim_item
        end,
    },
    sources = {
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        { name = 'omni' },
        { name = 'dictionary'},
    },
    documentation = {
       border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['jedi_language_server'].setup {
  capabilities = capabilities
}


require("cmp_dictionary").setup({
    dic = {
        ["txt,tex,markdown,pandoc"] = { "/usr/share/dict/american-english" },
    },
    exact = 2,
    first_case_insensitive = false,
})
