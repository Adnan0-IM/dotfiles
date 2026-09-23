require("sduf"):setup({
  position = 2900,
})

require("gvfs"):setup({
  which_keys = "1234567890qwertyuiopasdfghjklzxcvbnm-=[]\\;',./!@#$%^&*()_+{}|:\"<>?",
  blacklist_devices = { { name = "Wireless Device", scheme = "mtp" }, { scheme = "file" } },
  save_path = os.getenv("HOME") .. "/.config/yazi/gvfs.private",
  save_path_automounts = os.getenv("HOME") .. "/.config/yazi/gvfs_automounts.private",
  input_position = { "center", y = 0, w = 60 },
  password_vault = "keyring",
  save_password_autoconfirm = true,
})

require("what-size"):setup({
  priority = 400,
  LEFT = "",
  RIGHT = " ",
})

require("close-and-restore-tab"):setup()
