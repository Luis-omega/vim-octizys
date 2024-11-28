local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
return {
  s(
    { trig = "case" },
    {
      t("case ")
      , i(1)
    , t({ " of {", "" })
    , i(2, "_")
    , t(" -> ")
    , i(3, "_0")
    , t({ ",", "}" })
    }
  ),
  s(
    { trig = "fun" },
    {
      i(1)
      , t({ " : ", "  " })
    , i(2)
    , t(" : ")
    , i(3)
    , t({ "", "  -> " })
    , i(4)
    , t({ "", "= {", "  " })
    , i(5)
    , t({ "", "}" })
    }
  ),
  s(
    { trig = "data" },
    {
      t({ "data " })
      , i(1)
    , t(" ")
    , i(2)
    , t({ "=", "  |" })
    , i(3)
    , t({ "", ";" })
    }
  ),
  s(
    { trig = "pdata" },
    {
      t({ "public data " })
      , i(1)
    , t(" ")
    , i(2)
    , t({ "=", "  |" })
    , i(3)
    , t({ "", ";" })
    }
  ),
  s(
    { trig = "newtype" },
    {
      t({ "newytpe " })
      , i(1)
    , t(" ")
    , i(2)
    , t({ "=", "  " })
    , i(3)
    , t(";")
    }
  ),
  s(
    { trig = "pnewtype" },
    {
      t({ "public newytpe " })
      , i(1)
    , t(" ")
    , i(2)
    , t({ "=", "  " })
    , i(3)
    , t(";")
    }
  ),
  s(
    { trig = "alias" },
    {
      t({ "alias " })
      , i(1)
    , t(" ")
    , i(2)
    , t({ "=", "  " })
    , i(3)
    , t(";")
    }
  ),
  s(
    { trig = "import" },
    {
      t({ "import " })
      , i(1)
    , t({ "(", "  " })
    , i(2)
    , t({ "", "  ,", })
    , i(3)
    , t({ "", ")", "  as", "  " })
    , i(4)
    , t(";")
    }
  ),
  s(
    { trig = "let" },
    {
      t({ "let", "  " })
      , i(1)
    , t(" : ")
    , i(2)
    , t(" = ")
    , i(3)
    , t({ ",", "in", "  " })
    , i(4)
    }
  ),
}
