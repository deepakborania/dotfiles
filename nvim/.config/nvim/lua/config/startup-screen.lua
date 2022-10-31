local M = {}

function M.setup()

  local g = vim.g

  g.startify_custom_header = {
    ' ██████  ██    ██  █████  ███████ ██  ██████   ██████  ██████ ',
    '██    ██ ██    ██ ██   ██ ██      ██ ██       ██    ██ ██   ██',
    '██    ██ ██    ██ ███████ ███████ ██ ██   ███ ██    ██ ██   ██',
    '██ ▄▄ ██ ██    ██ ██   ██      ██ ██ ██    ██ ██    ██ ██   ██',
    ' ██████   ██████  ██   ██ ███████ ██  ██████   ██████  ██████ ',
    '    ▀▀                                                        ',
  }

  g.startify_session_dir = '~/.config/nvim/session'

  g.startify_lists = {
    { type = 'files', header = { '   Files' } },
    { type = 'dir', header = { "   Current Directory: " .. vim.fn.getcwd() } },
    { type = 'sessions', header = { '   Sessions' } },
    { type = 'bookmarks', header = { '   Bookmarks' } },
  }

  g.startify_bookmarks = {
    { p = '~/.config/nvim' },
    { z = '~/.zshrc' },
  }

  g.startify_change_to_vcs_root = true
end

return M
