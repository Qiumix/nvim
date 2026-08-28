vim.filetype.add({

  extension = {
    arb = "json",
    conf = "hyprlang",
    env = "dotenv",
    kbd = "lisp",
    log = "log",
    sld = "scheme",
    sls = "scheme",
    sps = "scheme",
    wgsl = "wgsl",
  },

  -- filename only match file's name, not path
  -- meanwhile not supporting regex
  filename = {
    [".env"] = "dotenv",
    ["env"] = "dotenv",
    ["grub"] = "sh",
    ["mkinitcpio.conf"] = "sh",
  },

  -- pattern match full path
  pattern = {
    ["/etc/default/grub"] = "sh",

    ["/etc/mkinitcpio%.conf"] = "sh",

    [".*/etc/mkinitcpio%.conf%.d/.*"] = "sh",
    ["[jt]sconfig.*.json"] = "jsonc",
    ["%.env%.[%w_.-]+"] = "dotenv",
  },
})
