return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeOpen" },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>",     desc = "Toggle file explorer" },
    { "<leader>fe", "<cmd>NvimTreeFindFile<cr>",  desc = "Focus current file in explorer" },
  },
  opts = {
    sort_by = "case_sensitive",
    view = {
      width = 30,
      adaptive_size = false,
    },
    renderer = {
      group_empty = true,
      root_folder_label = function(path)
        local name = vim.fn.fnamemodify(path, ":t")
        -- some options:            󰉋  󰆍  󰷏 󰉋 󰏗     󰙅
        return " " .. name
      end,
    },
    filters = {
      dotfiles = false,
    },
    actions = {
      open_file = {
        quit_on_open = false,
        window_picker = {
          enable = false,
        },
      },
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)

    local api = require("nvim-tree.api")
    -- Abrir archivo al crearlo
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd("edit " .. vim.fn.fnameescape(file.fname))
    end)

    local function is_nvimtree()
      return vim.bo.filetype == "NvimTree"
    end

    vim.keymap.set("n", "<M-Right>", function()
      if is_nvimtree() then
        vim.cmd("NvimTreeResize +2")
      end
    end, { silent = true, desc = "Resize NvimTree +" })

    vim.keymap.set("n", "<M-Left>", function()
      if is_nvimtree() then
        vim.cmd("NvimTreeResize -2")
      end
    end, { silent = true, desc = "Resize NvimTree -" })
  end,
}
