-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- vim.api.nvim_create_autocmd("TermOpen", {
--   pattern = "*gitui*",
--   callback = function()
--     vim.cmd([[
--       hi Terminal guibg=#1a1b26 guifg=#c0caf5
--       hi TermCursor guibg=#7aa2f7 guifg=#1a1b26
--     ]])
--   end,
-- })
vim.api.nvim_create_autocmd({ "DirChanged" }, {
  callback = function()
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    -- Format the project name, replacing dashed with spaces and capitalizing the first letter of each word
    local project_name_formatted = project_name:gsub("%-", " "):gsub("(%a)([%w_']*)", function(first, rest)
      return first:upper() .. rest
    end)
    vim.opt.titlestring = " " .. project_name_formatted
    vim.opt.title = true
  end,
})
vim.api.nvim_create_autocmd("DirChanged", {
  pattern = "global",
  callback = function()
    local utils = require("config.utils")
    local project = utils.getProject()
    -- if project is nil then set colors to NONE
    if not project or not project.colors then
      vim.fn.system("kitten @ set-tab-color " .. "active_bg=NONE " .. "inactive_bg=NONE ")
      return
    end
    local allowed = { active_bg = true, active_fg = true, inactive_bg = true, inactive_fg = true }

    -- Extract the color values
    local args = { "kitten", "@", "set-tab-color" }
    for key, value in pairs(project.colors) do
      if allowed[key] then
        table.insert(args, key .. "=" .. tostring(value))
      else
        vim.notify("Ignoring invalid color key: " .. key, vim.log.levels.WARN)
      end
    end

    -- Set the kitten values
    vim.fn.system(args)
  end,
})

-- set title string on vim startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.titlestring = " " .. "LazyVim"

    vim.opt.title = true
  end,
})
