rule = {
  matches = {
    {
      { "device.nick", "matches", "HDA Intel PCH" },
    },
  },
  apply_properties = {
    ["api.alsa.use-acp"] = true,
    ["api.acp.auto-profile"] = false,
    ["api.acp.auto-port"] = false,
    ["device.profile-set"] = "multiple.conf",
    ["device.profile"] = "multiple",
  },
}
table.insert(alsa_monitor.rules,rule)
