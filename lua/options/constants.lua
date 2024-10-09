local CONSTANTS = require('constants')

return {
  options = {
    termguicolors = true, -- Enables 24-bit RGB color in the Terminal UI.
    number = true, -- Get line numbers
    relativenumber = true, -- Get relative numbers
    wrap = false, -- Workd wrap
    linebreak = true, -- Wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen.
    breakindent = true, --  Wrapped line will continue visually indented (same amount of space as the beginning of that line), thus preserving horizontal blocks of text.
    cursorline = true, -- Highlight the line cursor is on
    tabstop = 2, -- Number of spaces that a <Tab> in the file counts for.
    shiftwidth = 2, -- Number of spaces to use for each step of (auto)indent.
    expandtab = true, --  Convert Tabs to spaces
    swapfile = false, -- No swap files
    writebackup = false, -- No backup
    undofile = true, -- Preserve undohistory in a file so it is can be used after quiting vim
    undodir = CONSTANTS.UNDO_DIR, -- Location of undofiles
    splitright = true, -- Open vertical split on right by default
    ignorecase = true, -- Ignore case while searching
    smartcase = true, --  Override the 'ignorecase' option if the search pattern contains upper case characters.
    confirm = true, -- Show confirmation prompt on closing unsaved buffer
    signcolumn = 'yes', -- Always show sign column
    iskeyword = function(current_value)
      return table.concat({ current_value, '-' }, ',') -- Consider hello-world as a single word
    end,
    showmode = false, -- Don't show current mode in statusline
    hidden = true, -- Hide buffer instead of closing on buffer change
    autoread = true, -- Update vim if a file changes from outside of vim
    shortmess = function(current_value)
      return current_value .. 'I' -- Disable introduction screen on startup
    end,
    packpath = CONSTANTS.PACK_PATH, -- Set path for plugins
    cmdheight=0, --set cmdheight=0
  },
}
