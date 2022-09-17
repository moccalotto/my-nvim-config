local default_options = {
  backup = false, -- No backup
  -- clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 1, -- The height of the command line
  -- colorcolumn = "99999", -- fixes indentline for now
  -- completeopt = { "menuone", "noselect" },
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
  foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
  guifont = "monospace:h17", -- the font used in graphical neovim applications
  -- hidden = true, -- required to keep multiple buffers and open multiple buffers
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  -- showmode = false, -- we don't need to see things like -- INSERT -- anymore
  --  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
--  timeoutlen = 250, -- time to wait for a mapped sequence to complete (in milliseconds)
  title = true, -- set the title of window to the value of the titlestring
  titlestring = "%<%F%=%l/%L - nvim", -- what the title of the window will be set to
  undofile = false, -- enable persistent undo
  updatetime = 250, -- faster completion
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 4, -- the number of spaces inserted for each indentation
  tabstop = 4, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = true, -- set relative numbered lines
  numberwidth = 4, -- set number column width
  gdefault  = true,
  -- signcolumn = "yes:1", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  -- shadafile =
  scrolloff = 6, -- minimal number of screen lines to keep above and below the cursor.
  sidescrolloff = 8, -- minimal number of screen chars to keep left and right of the cursor.
  list = true,
-- listchars = "eol:↴,nbsp:+,space:⋅,tab:> ,trail:⋅",
--  listchars = "eol:↴,nbsp:+,space:⋅,tab:> ,trail:⋅",
  listchars = "tab:▹ ,trail:·,nbsp:⚋",
  wildoptions = "pum",  -- use PopUpMenu in command line
  pumblend = 5,        -- transparency in PopUpMenu
}

---  SETTINGS  ---
 vim.opt.shortmess:append "c" -- don't show redundant messages from ins-completion-menu
 vim.opt.shortmess:append "I" -- don't show the default intro message
 vim.opt.whichwrap:append "<,>,[,],h,l"

if #vim.api.nvim_list_uis() == 0 then
  vim.opt.shortmess = "" -- try to prevent echom from cutting messages off or prompting
  vim.opt.more = false -- don't pause listing when screen is filled
  vim.opt.cmdheight = 9999 -- helps avoiding |hit-enter| prompts.
  vim.opt.columns = 9999 -- set the widest screen possible
  vim.opt.swapfile = false -- don't use a swap file
else

  -- Load all the default options
  for k, v in pairs(default_options) do
    vim.opt[k] = v
  end
--  vim.cmd('colorscheme jellybeans')

end
