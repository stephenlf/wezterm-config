-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = 'AdventureTime'
config.default_prog = { 'fish' }

config.keys = {
  -- Create a new tab in the same domain as the current pane.
  {
	  key = 't',
	  mods = 'ALT',
	  action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  -- Close current tab
  {
	  key = 'w',
	  mods = 'ALT',
	  action = wezterm.action.CloseCurrentTab { confirm = false } ,
  },
  {
	  key = 'n',
	  mods = 'ALT',
	  action = wezterm.action.SplitHorizontal,
  },
  {
	  key = 'm',
	  mods = 'ALT',
	  action = wezterm.action.SplitVertical,
  },
  {       key = '[', mods = 'ALT', action = wezterm.action.ActivateTabRelative(-1) },
  {	  key = ']', mods = 'ALT', action = wezterm.action.ActivateTabRelative(1) },
}

for i = 1, 8 do
  -- CTRL+ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'ALT',
    action = wezterm.action.ActivateTab(i - 1),
  })
  -- F1 through F8 to activate that tab
  table.insert(config.keys, {
    key = 'F' .. tostring(i),
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return config
