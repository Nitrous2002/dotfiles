return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    vim.cmd([[
    let g:mkdp_theme = 'dark'
    let g:mkdp_browser = 'firefox'
    let g:mkdp_auto_start = 1
    ]])
  end,
  ft = { "markdown" },
}
