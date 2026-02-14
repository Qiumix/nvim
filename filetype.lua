vim.filetype.add({
  -- filename only match file's name, not path
  -- meanwhile not supporting regex
  filename = {
    ["grub"] = "sh",
    ["mkinitcpio.conf"] = "sh",
  },

  -- pattern match full path
  pattern = {
    ["/etc/default/grub"] = "sh",

    ["/etc/mkinitcpio%.conf"] = "sh",

    [".*/etc/mkinitcpio%.conf%.d/.*"] = "sh",
  },
})
