local M = {}

function M.get_default_config()
  return {
    load_snippets = true,
    enable_comments = true,
  }
end

function M.sanitize_config(user_config)
  local config = {}
  if user_config == nil then
    user_config = {}
  end
  for key, default in pairs(M.get_default_config()) do
    local value = user_config[k]
    if value ~= nil then
      config[key] = value
    else
      config[key] = default
    end
  end
  return config
end

function M.setup(user_config)
  local config = M.sanitize_config(user_config)
  if config["load_snippets"] then
    M.load_snippets()
  end
  if config["set_comments"] then
    M.set_comments()
  end
end

function M.set_comments()
  vim.cmd [[set comments=://,:--,s:{-,m:\ ,e:-}]]
  vim.cmd [[set formatoptions=croj]]
end

function M.load_snippets()
  local status, ls = pcall(require, "luasnip")
  if status then
    local snippets = require("snippets")
    ls.add_snippets("octizys", snippets)
  end
end

return M
