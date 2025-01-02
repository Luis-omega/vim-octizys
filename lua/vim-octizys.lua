local M = {}

function M.get_default_config()
  return {
    load_snippets = true,
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
end

function M.load_snippets()
  local status, ls = pcall(require, "luasnip")
  if status then
    local snippets = require("snippets")
    ls.add_snippets("octizys", snippets)
  end
end

return M
