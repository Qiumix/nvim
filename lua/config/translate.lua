return {
  default = {
    cmds = {
      source = "auto",
      target = "zh-CN",
      handle = "float",
      engine = "google",
    },
    cache = true,
  },
  engine = {},
  hooks = {
    ---@module "smart-translate"
    ---@param opts SmartTranslate.Config.Hooks.BeforeCallOpts
    ---@return string[]
    before_translate = function(opts)
      return opts.original
    end,
    ---@module "smart-translate"
    ---@param opts SmartTranslate.Config.Hooks.AfterCallOpts
    ---@return string[]
    after_translate = function(opts)
      return opts.translation
    end,
  },
  -- Custom translator
  translator = {
    engine = {},
    handle = {},
  },
}
