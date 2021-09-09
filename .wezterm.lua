local wezterm = require 'wezterm';

wezterm.on("toggle-ligature", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if not overrides.harfbuzz_features then
    -- If we haven't overriden it yet, then override with ligatures disabled
    overrides.harfbuzz_features =  {"calt=0", "clig=0", "liga=0"}
  else
    -- else we did already, and we should disable out override now
    overrides.harfbuzz_features = nil
  end
  window:set_config_overrides(overrides)
end)

return {
  check_for_updates = true,
  show_update_window = false,
  keys = {
      {key="E", mods="CTRL", action=wezterm.action{EmitEvent="toggle-ligature"}},
    -- This will create a new split and run your default program inside it
    {key="%", mods="CTRL|ALT",
      action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
  
    -- This will create a new split and run your default program inside it
    {key="\"", mods="CTRL|ALT",
      action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},

  }
}
