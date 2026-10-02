local function indent(size, expand)
  return {
    size = size,
    expand = expand,
  }
end

local indents = {
  c = indent(4, true),
  go = indent(4, false),
  sh = indent(2, true),
  lua = indent(2, true),
  rust = indent(4, true),
  python = indent(4, true),
  javascript = indent(2, true),
  css = indent(2, true),
  html = indent(2, true),
  r = indent(2, true),
}
local function set_autocommands()
  local filetype = indents[vim.bo.filetype]
  if not filetype then
    return
  end
  vim.bo.shiftwidth = filetype.size
  vim.bo.tabstop = filetype.size
  vim.bo.softtabstop = filetype.size
  vim.bo.expandtab = filetype.expand
end

local group = vim.api.nvim_create_augroup("FileTypeIndent", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  callback = set_autocommands,
})
