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
        "-L",
        "--no-hidden",
        "--exclude",
        ".git",
        "--strip-cwd-prefix",
        -- "-e", "tex", "-e", "bib", "-e", "sty", "-e", "cls",
        -- "-e", "py", "-e", "cpp", "-e", "java",
        -- "-e", "js", "-e", "rust", "-e", "ipynb",
        -- "-e", "md", "-e", "wiki", "-e", "lua"
      }
    },
    live_grep = {
      theme = "dropdown",
      prompt_prefix="🔍",
    }
  },
  defaults = {
      mappings = {
          i = {
            ["jk"] = require('telescope.actions').close,
          },
      },
  },
  extensions = {
    file_browser = {
          theme = "ivy",
    }  
  }
}
require("telescope").load_extension "file_browser"

require("themes.startup")


require("cmp_dictionary").setup({
    dic = {
        ["org,txt,tex,markdown,pandoc"] = { "/usr/share/dict/american-english" },
    },
    exact = 2,
    first_case_insensitive = false,
})


-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {'org'},
    additional_vim_regex_highlighting = {'org'}, 
  },
}


local orgmode = require('orgmode')
local org = orgmode.setup({
  org_agenda_files = {'~/Documents/personal/wikiNotes/org/orgmode/*'},
  org_default_notes_file = '~/Documents/personal/wikiNotes/org/orgmode/inbox.org',
  org_archive_location = '.%s_archive:: ',
  org_agenda_span = 'day',
  org_agenda_skip_scheduled_if_done = false,
  org_agenda_skip_deadline_if_done = true,
  org_deadline_warning_days = 7,
  mappings = {
    global = {
      org_agenda = {'gA'},
      org_capture = {'gC'}
    },
    org = {
      org_clock_in = '<Leader>i',
      org_clock_out = '<Leader>o',
      org_archive_subtree = '<leader>aa',
      org_refile = '<Leader>m',
      org_todo = 't',
      org_change_date = 'K',
    },
    capture = {
      org_capture_refile = '<Leader>m',
      org_capture_finalize = 'Q',
    },
    agenda = {
        org_agenda_clock_in = '<leader>i',
        org_agenda_clock_out = '<leader>o',
        org_agenda_switch_to = { '<TAB>' },
        org_agenda_goto = '<CR>',
        org_agenda_later = 'L',
        org_agenda_earlier = 'H',
    },
  },
  -- org_agenda_min_height = 20,
  org_todo_keywords = {'TODO', 'WAITING', 'LATER', '|', 'DONE',  'INACTIVE(i)', 'MEETING'},
  org_todo_keyword_faces = {
        WAITING = ':foreground 229 :weight bold',
        LATER = ':foreground yellow :weight bold',
        MEETING = ':foreground 67 :weight bold',
        INACTIVE = ':foreground black',
 },
 org_agenda_templates =  { 
     t = { description = 'Task', template = '* TODO %?\n'},
     d = { description = 'Deadline', template = '* TODO %?\n  DEADLINE: %T'},
     s = { description = 'Schedule', template = '* TODO %?\n SCHEDULED: %T'} ,
     m = { description = 'Meeting', template = '* MEETING %u\n%?'},
 },
 notifications = {
     enabled = false,
     cron_enabled = true,
     repeater_reminder_time = false,
     deadline_warning_reminder_time = 0,
     reminder_time = 5,
     deadline_reminder = true,
     scheduled_reminder = true,
     cron_notifier = function(tasks)
         for _, task in ipairs(tasks) do
           local title = string.format('%s (%s)', task.category, task.humanized_duration)
           local subtitle = string.format('%s %s %s', string.rep('*', task.level), task.todo, task.title)
           local date = string.format('%s: %s', task.type, task.time:to_string())

           if vim.fn.executable('notify-send') == 1 then
            local title, i = title:gsub("1", "",1)  
             vim.loop.spawn('notify-send', {
                 args = { string.format('%s\n%s\n%s', title, subtitle, date),
                          "-t",  0, "-i", "/home/rahul/Pictures/orgmode.jpg"}
             })
           end
         end
     end
  },
 org_hide_leading_stars=true,
})

function _G.capture_from_terminal()
  org:init()
  -- Ensure org is initialized
  vim.schedule(function()
    vim.cmd('cd ~/Documents/personal/wikiNotes/org/orgmode/')
    vim.cmd('normal e')
    org.capture:prompt()
    vim.cmd('only')
    -- Map Q to write + exit Neovim. Make sure to leave vim.schedule calls
    -- to make sure everything is written
    vim.keymap.set('n', 'Q', function()
      vim.cmd[[wq]]
      vim.schedule(function()
        vim.cmd[[qall!]]
      end)
    end)
  end)
end

function _G.agenda_from_terminal()
  org:init()
  -- Ensure org is initialized
  vim.schedule(function()
    -- Open desired template
    vim.cmd('cd ~/Documents/personal/wikiNotes/org/orgmode/')
    vim.cmd('normal e')
    org.agenda:agenda()
    vim.cmd('only')
    -- Map Q to write + exit Neovim. Make sure to leave vim.schedule calls
    -- to make sure everything is written
    vim.keymap.set('n', 'Q', function()
        vim.cmd([[qa]])
    end)
  end)
end

function _G.todo_from_terminal()
  org:init()
  -- Ensure org is initialized
  vim.schedule(function()
    -- Open desired template
    vim.cmd('cd ~/Documents/personal/wikiNotes/org/orgmode/')
    vim.cmd('normal e')
    org.agenda:todos()
    vim.cmd('only')
    -- Map Q to write + exit Neovim. Make sure to leave vim.schedule calls
    -- to make sure everything is written
    vim.keymap.set('n', 'Q', function()
        vim.cmd([[qa]])
    end)
  end)
end


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
            path = "[Path]",
            nvim_lsp = "[LSP]",
            buffer = "[Buffer]",
            orgmode = "[org]",
            dictionary = "[Spell]",
          })[entry.source.name]
          return vim_item
        end,
    },
    sources = {
        { name = 'luasnip'},
        { name = 'path'},
        { name = 'nvim_lsp'},
        { name = 'orgmode'},
        { name = 'buffer'},
        { name = 'dictionary'},
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
})





-- See https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/lsp/handlers.lua
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- On attach function
on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n",
      "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n",
      "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n",
      "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n",
      "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n",
      "[d",
      '<cmd>lua vim.diagnostic.goto_prev()<CR>',
      opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n",
      "]d",
      '<cmd>lua vim.diagnostic.goto_next()<CR>',
      opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n",
      "<leader>s", "<cmd>lua vim.diagnostic.setloclist()<CR>",
      opts)
end


-- Setup
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {
        texthl = sign.name, text = sign.text, numhl = ""
    })
end

local config = {
    virtual_text = false,
    signs = {
      active = signs,
    },
    update_in_insert = false,
    signcolumn = number,
    underline = false,
    severity_sort = true,
	float = {
        header="",
        prefix="",
		border = "single",
        style = "minimal",
		format = function(diagnostic)
			return string.format(
				"%s (%s) [%s]",
				diagnostic.message,
				diagnostic.source,
				diagnostic.code or diagnostic.user_data.lsp.code
			)
		end,
	},
}

vim.diagnostic.config(config)


-- Initialize all LSPs
local lsp_installer = require "nvim-lsp-installer"
lsp_installer.on_server_ready(function(server)
	local opts = {
        on_attach = on_attach,
		capabilities = capabilities,
	}

	 if server.name == "jedi_language_server" then
	 	local jedi_opts = { }
	 	opts = vim.tbl_deep_extend("force", jedi_opts, opts)
	 end

	server:setup(opts)
end)
