-- return {
--   "craftzdog/solarized-osaka.nvim",
--   lazy = true,
--   priority = 1000,
--   opts = function()
--     return {
--       transparent = true,
--     }
--   end,
-- }
--
-- return {
--   { "dasupradyumna/midnight.nvim", lazy = false, priority = 1000 },
--
-- }
--
return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  priority = 1000,
  opts = function()
    return {
      flavor = "mocha", -- You can choose "latte", "frappe", "macchiato", or "mocha"
      transparent_background = true,
    }
  end,
}
