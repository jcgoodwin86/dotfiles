-- Entry point for Neovim config.
-- Loads options first (before plugins), then bootstraps the plugin manager,
-- then keymaps last (so plugins are available when keymaps are defined).

require("config.options")
require("config.lazy")
require("config.keymaps")
