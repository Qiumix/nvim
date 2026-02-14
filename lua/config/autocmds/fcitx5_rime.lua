local rime_group = vim.api.nvim_create_augroup("RimeAutoMode", { clear = true })
local rime_last_state = true -- false 表示中文, true 表示英文

-- 封装：仅在状态不同时执行切换
local function rime_switch_to(target_state)
  -- 获取当前真实状态
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
    if data then
      local current_is_ascii = data:find("true") ~= nil
      -- 核心优化：只有当前状态与目标状态不一致时，才调用 SetAsciiMode
      if current_is_ascii ~= target_state then
        vim.schedule(function()
          vim.loop.spawn("busctl", {
            args = { "--user", "call", "org.fcitx.Fcitx5", "/rime", "org.fcitx.Fcitx.Rime1", "SetAsciiMode", "b", target_state and "true" or "false" },
            detach = true
          }, nil)
        end)
      end
    end
  end)
end

-- 离开插入模式：记录状态并强制切为英文
vim.api.nvim_create_autocmd("InsertLeave", {
  group = rime_group,
  callback = function()
    -- 这里的逻辑：先查当前状态并存入 rime_last_state，然后确保切到 true (英文)
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
      if data then
        rime_last_state = data:find("true") ~= nil
        -- 如果当前不是英文，才切往英文
        if not rime_last_state then
          vim.schedule(function()
            vim.loop.spawn("busctl", {
              args = { "--user", "call", "org.fcitx.Fcitx5", "/rime", "org.fcitx.Fcitx.Rime1", "SetAsciiMode", "b", "true" },
              detach = true
            }, nil)
          end)
        end
      end
    end)
  end,
})

-- 进入插入模式：还原到离开前的状态
vim.api.nvim_create_autocmd("InsertEnter", {
  group = rime_group,
  callback = function()
    rime_switch_to(rime_last_state)
  end,
})
