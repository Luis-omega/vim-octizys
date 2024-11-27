local M = {}

function M.get_default_config()
  return {
    load_snippets = true,
    enable_comments = true,
  }
end

function M.setup(config)
  local lconfig = {}
  if config ~= nil then
    lconfig = M.get_default_config()
  else
    lconfig = config
  end
  if lconfig["load_snippets"] then
    M.load_snippets()
  end
  if lconfig["enable_comments"] then
    M.enable_comments()
  end
end

function M.enable_comments()
  vim.cmd [[set comments=://,:--,s:{-,m:\ ,e:-}]]
  vim.cmd [[set formatoptions=croj]]
end

local function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then k = '"' .. k .. '"' end
      s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end


-- Attempt to load the snippets
function M.load_snippets()
  local ls = require("luasnip")
  local snippets = {
    ls.s(
      { trig = "case" },
      {
        ls.t("case ")
        , ls.i(1)
      , ls.t({ " of {", "" })
      , ls.i(2, "_")
      , ls.t(" -> ")
      , ls.i(3, "_0")
      , ls.t({ ",", "}" })
      }
    ),
    ls.s(
      { trig = "fun" },
      {
        ls.i(1)
        , ls.t({ " : ", "  " })
      , ls.i(2)
      , ls.t(" : ")
      , ls.i(3)
      , ls.t({ "", "  -> " })
      , ls.i(4)
      , ls.t({ "", "= {", "  " })
      , ls.i(5)
      , ls.t({ "", "}" })
      }
    ),
    ls.s(
      { trig = "data" },
      {
        ls.t({ "data " })
        , ls.i(1)
      , ls.t(" ")
      , ls.i(2)
      , ls.t({ "=", "  |" })
      , ls.i(3)
      , ls.t({ "", ";" })
      }
    ),
    ls.s(
      { trig = "pdata" },
      {
        ls.t({ "public data " })
        , ls.i(1)
      , ls.t(" ")
      , ls.i(2)
      , ls.t({ "=", "  |" })
      , ls.i(3)
      , ls.t({ "", ";" })
      }
    ),
    ls.s(
      { trig = "newtype" },
      {
        ls.t({ "newytpe " })
        , ls.i(1)
      , ls.t(" ")
      , ls.i(2)
      , ls.t({ "=", "  " })
      , ls.i(3)
      , ls.t(";")
      }
    ),
    ls.s(
      { trig = "pnewtype" },
      {
        ls.t({ "public newytpe " })
        , ls.i(1)
      , ls.t(" ")
      , ls.i(2)
      , ls.t({ "=", "  " })
      , ls.i(3)
      , ls.t(";")
      }
    ),
    ls.s(
      { trig = "alias" },
      {
        ls.t({ "alias " })
        , ls.i(1)
      , ls.t(" ")
      , ls.i(2)
      , ls.t({ "=", "  " })
      , ls.i(3)
      , ls.t(";")
      }
    ),
    ls.s(
      { trig = "import" },
      {
        ls.t({ "import " })
        , ls.i(1)
      , ls.t({ "(", "  " })
      , ls.i(2)
      , ls.t({ "", "  ,", })
      , ls.i(3)
      , ls.t({ "", ")", "  as", "  " })
      , ls.i(4)
      , ls.t(";")
      }
    ),
    ls.s(
      { trig = "let" },
      {
        ls.t({ "let", "  " })
        , ls.i(1)
      , ls.t(" : ")
      , ls.i(2)
      , ls.t(" = ")
      , ls.i(3)
      , ls.t({ ",", "in", "  " })
      , ls.i(4)
      }
    ),
  }
  ls.add_snippets("octizys", snippets)
end

M.setup({ load_snippets = true, enable_comments = true })
return M
