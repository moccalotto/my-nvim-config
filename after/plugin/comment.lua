local ok, comment = pcall(require, "Comment")

if not ok then
  return
end

require("Comment").setup(
  {
    padding = true, -- add space around the comment.
    sticky  = true, -- keep the curser where it is when inserting comments.
    ignore  = nil,  -- lines to ignore when commenting/uncommenting.

    --[[ toggler = {
      line  =  "gcc",
      block =  "gbc",
    }, ]]

    -- requires mapping.basic = true
    opleader = {
      line = "gc",
      block = "gb",
    },

    -- requires mapping.extra = true
    extra = {
      above = "gcO",
      belov = "gco",
      eol   = "gcA",
    },

    -- keyboard mappings to register
    mapping = {
      basic = true,

      ---Extra mapping; `gco`, `gcO`, `gcA`
      extra = true,

      ---Extended mapping; `g>` `g<` `g>[count]{motion}` `g<[count]{motion}`
      extended = false,
    },

    pre_hook = nil,
    post_hook = nil,
  }
)
