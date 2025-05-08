return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- Show hidden files by default
        hide_dotfiles = false, -- Ensure dotfiles like .env are visible
        hide_by_name = { -- Optional: remove any specific filtering of .env
          -- "node_modules", ".git", ".env" -- remove ".env" from this list
        },
      },
    },
    window = {
      position = "right", -- Move Neo-tree to the right side
      popup = { -- Customize floating window appearance
        size = {
          height = 0.8, -- 80% of screen height
          width = 0.8, -- 60% of screen width
        },
        border = "rounded", -- Optional: 'rounded', 'single', 'double', 'shadow'
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)

    -- Add custom highlights for Neo-tree
    vim.cmd([[
      " Set Neo-tree background to transparent
      highlight NeoTreeNormal guibg=NONE ctermbg=NONE
      highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
      highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
      highlight WinSeparator guibg=NONE guifg=#444444

      " Set directory and file colors to Solarized theme
      highlight NeoTreeDirectoryName guifg=#268BD2
      highlight NeoTreeDirectoryIcon guifg=#268BD2
      highlight NeoTreeFileName guifg=#839496
      highlight NeoTreeFileNameOpened guifg=#B58900

      " Customize Git status colors (optional)
      highlight NeoTreeGitAdded guifg=#859900
      highlight NeoTreeGitModified guifg=#B58900
      highlight NeoTreeGitDeleted guifg=#DC322F

      " Fix transparent background rendering issue (add this)
      highlight Normal guibg=NONE
      highlight NonText guibg=NONE
    ]])

    vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWinLeave" }, {
      pattern = "*Neo-tree*",
      callback = function()
        vim.cmd("redraw!")
      end,
    })
  end,
}
