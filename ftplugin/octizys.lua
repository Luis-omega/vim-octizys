local set_comments = function()
  -- Tell vim how a comment looks.
  vim.api.nvim_set_option_value("comments", "://,:--,s:{-,m:\\ ,e:-}", { scope = "local" })
  -- Tell vim how to insert indentation and manage comments
  -- (like auto insert comment start at new line or join comments).
  vim.api.nvim_set_option_value("formatoptions", "croj", { scope = "local" })
  -- TODO: set formatprg to octizys formmater
end

--- Generates a table with all the possible error formats for the octizys compiler.
--- @return string[]
local function gen_error_lines()
  return {
    "%EError!:%m,%C\\ \\ -->%f::From::Line{%l}::Column{%c}::To::Line{%e}::Column{%k},%C\\ \\ -->%f::At::Line{%l}::Column{%c},%+C\\ %.%#"

  }
end

--- Merges lines for error format with the appropriate separator between them.
--- @param lines string[]
--- @return string
local function merge_error_lines(lines)
  return table.concat(lines, ",")
end

--- Set the `errorformat` for octizys error messages.
local set_error_format = function()
  --- @type string[]
  local error_lines = gen_error_lines()
  local error_message = merge_error_lines(error_lines)
  vim.api.nvim_set_option_value("errorformat", error_message, { scope = "local" })
end

--- Set the options `errorformat` and `make` for octizys.
local set_make = function()
  set_error_format()
  vim.api.nvim_set_option_value("makeprg", "octizys -m -c 80 compile %", { scope = "local" })
  vim.api.nvim_set_option_value("formatprg", "octizys -m -c 80 --separe-by 1 format %", { scope = "local" })
end


local function setup()
  set_comments()
  -- TODO: search for :h write-compiler-plugin , it does what we are doing here!
  set_make()
end

setup()
