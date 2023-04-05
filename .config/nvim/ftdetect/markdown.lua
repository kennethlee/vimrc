local add = vim.filetype.add
local markdown = "markdown"

add({
  extension = {
    markdown = markdown,
    md = markdown,
    mdown = markdown,
    mkd = markdown,
    mkdn = markdown,
  }
})
