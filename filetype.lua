vim.filetype.add({
  extension = {
    env = "dotenv",
  },

  -- filename only match file's name, not path
  -- meanwhile not supporting regex
  filename = {
    ["grub"] = "sh",
    ["mkinitcpio.conf"] = "sh",
    [".env"] = "dotenv",
    ["env"] = "dotenv",
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
