local vcode = vim.cmd

-- vcode([[set termguicolors]])

local colorscheme = "gruvbox"
local status_ok, _ = pcall(vcode, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
  return
end

-- 背景透明
vcode(
[[
set background=dark
highlight Normal guibg=NONE ctermbg=None
]]
)
--hi Normal ctermfg=252 ctermbg=none
