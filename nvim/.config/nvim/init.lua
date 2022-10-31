local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

local g = vim.g

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'shada_plugin',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip'--,
 -- 'netrwPlugin',
}
for i = 1, 9 do
  g['loaded_' .. disabled_built_ins[i]] = 1
end

require("plugins").setup()

