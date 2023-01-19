local status, mason = pcall(require, "mason")
if not status then
  vim.notify("没有找到 mason")
  return
end

local status, masonlsp = pcall(require, "mason-lspconfig")
if not status then
  vim.notify("没有找到 mason-lspconfig")
  return
end

local status, lsp=pcall(require, "lspconfig")
if not status then
  vim.notify("没有找到lspconfig")
  return
end


mason.setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
})

--- mason-lspconfig mason自动安装升级插件
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
masonlsp.setup({
  ensure_installed = {
    "clangd",
    "ltex",
    "remark_ls",
    "pyright",
    "sumneko_lua",
  }
})

local servers = {
  sumneko_lua = require("lsp.config.lua"),
  clangd = require("lsp.config.cpp"),
  ltex = require("lsp.config.latex"),
  remark_ls = require("lsp.config.markdown"),
  pyright = require("lsp.config.python"),
}

for name,config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup方法
    config.on_setup(lsp[name])
  else
    -- 使用默认参数
    lsp[name].setup({})
  end
end

