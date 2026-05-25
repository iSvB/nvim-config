local mason_servers = {
  "lua_ls",
  "clangd",
  "ts_ls",
  "gopls",
}

local manual_servers = {
  "roslyn_ls",
}

local servers = {}
vim.list_extend(servers, mason_servers)
vim.list_extend(servers, manual_servers)

return {
  mason_servers = mason_servers,
  manual_servers = manual_servers,
  servers = servers,
}
