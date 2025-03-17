return {
    -- Interactive checkboxes with orgmode
    {
      "nvim-orgmode/orgmode",
      config = function()
        require("orgmode").setup({
          org_todo_keywords = { "TODO", "|", "DONE" },
          org_todo_keyword_faces = {
            TODO = ":foreground #FF8800 :weight bold",
            DONE = ":foreground #50FA7B :weight bold",
          },
        })
      end,
    },
  
    -- Auto-format bullets and checkboxes
    {
      "dkarter/bullets.vim",
      ft = { "markdown", "text", "org" },
    },
  }
  
  