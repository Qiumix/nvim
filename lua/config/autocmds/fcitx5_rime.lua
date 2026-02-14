-- 定义 Rime 状态控制模块
local function rime_set_ascii(bool_val)
  local state = bool_val and "true" or "false"
  vim.loop.spawn("busctl", {
    args = { "--user", "call", "org.fcitx.Fcitx5", "/rime", "org.fcitx.Fcitx.Rime1", "SetAsciiMode", "b", state },
    detach = true
  }, nil)
end

-- 局部变量存储状态
local rime_last_state = true

local function rime_save_and_set_ascii()
  -- 异步获取当前状态
  local stdout = vim.loop.new_pipe(false)
  local handle
  handle = vim.loop.spawn("busctl", {
    args = { "--user", "call", "org.fcitx.Fcitx5", "/rime", "org.fcitx.Fcitx.Rime1", "IsAsciiMode" },
    stdio = { nil, stdout, nil }
  }, function()
    stdout:close()
    handle:close()
  end)

  stdout:read_start(function(err, data)
    assert(not err)
    if data then
      -- 解析返回结果，如果包含 true 则记为 true
      rime_last_state = data:find("true") ~= nil
      -- 记忆后立即设为英文 (Normal 模式需要)
      vim.schedule(function()
        rime_set_ascii(true)
      end)
    end
  end)
end

-- 设置 Autocmd
local rime_group = vim.api.nvim_create_augroup("RimeAutoMode", { clear = true })

-- 进入插入模式：还原状态
vim.api.nvim_create_autocmd("InsertEnter", {
  group = rime_group,
  pattern = "*",
  callback = function()
    rime_set_ascii(rime_last_state)
  end,
})

-- 离开插入模式：记忆状态并切为英文
vim.api.nvim_create_autocmd("InsertLeave", {
  group = rime_group,
  pattern = "*",
  callback = function()
    rime_save_and_set_ascii()
  end,
})
