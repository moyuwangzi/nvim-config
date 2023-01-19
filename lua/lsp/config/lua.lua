local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, [[lua/?/init.lua]])

local opts = {
  settings = {
    Lua = {
      runtime = {
        -- 告诉语言服务器你要用哪个版本的lua(neovim基本用的luaJIT)
        version = [[LuaJIT]],
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        -- 让服务器识别当前neovim的运行文件
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
    -- 禁用格式化功能
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    --------------
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    --   vim.api.nvim_set_keymap(...)
    end

    -- 绑定快捷键
    require('lua.keybinds').mapLSP(buf_set_keymap)
    -- 保存时自动格式化
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
  end,
}

-- 查看目录等信息
return {
  on_setup = function(server)
    server:setup(opts)
  end,
}
