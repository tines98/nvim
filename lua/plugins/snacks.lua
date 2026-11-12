return {
  "folke/snacks.nvim",
  opts = {
    lazygit = {},
    explorer = {
      hidden = true,
    },
    dashboard = {
      preset = {
        pick = "telescope.nvim",
        keys = {
          { icon = "\u{ea83} ", key = "p", desc = "All Projects", action = "<leader>fp" },
          { icon = "\u{f1654} ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = "\u{ea7f} ", key = "n", desc = "New File", action = ":ene | startinsert" },
          {
            icon = "\u{f002} ",
            key = "g",
            desc = "Find Text",
            action = ":lua Snacks.dashboard.pick('live_grep')",
          },
          {
            icon = "\u{f1da} ",
            key = "r",
            desc = "Recent Files",
            action = ":lua Snacks.dashboard.pick('oldfiles')",
          },
          {
            icon = "\u{f013} ",
            key = "c",
            desc = "Config",
            action = ":cd ~/.config/nvim/ | e README.md | lua Snacks.explorer()",
          },
          { icon = "\u{f110d} ", key = "s", desc = "Restore Session", section = "session" },
          {
            icon = "\u{f487} ",
            key = "l",
            desc = "Lazy",
            action = ":Lazy",
            enabled = package.loaded.lazy ~= nil,
          },
          {
            icon = "\u{f0431} ",
            key = "x",
            desc = "Lazy Extras",
            action = ":LazyExtras",
            enabled = package.loaded.lazy ~= nil,
          },
          { icon = "\u{f011} ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
▀██▀                               ▀██▀  ▀█▀  ██                ▀██▀▀█▄   █▀▀██▀▀█ ▀██ ▀██▀  ▀█▀ 
 ██     ▄▄▄ ▄▄▄   ▄▄▄▄    ▄▄▄▄      ▀█▄  ▄▀  ▄▄▄  ▄▄ ▄▄ ▄▄       ██   ██     ██     ▀█▄ ▀█▄  ▄▀  
 ██      ██  ██  ██▄ ▀  ▄█▄▄▄██      ██  █    ██   ██ ██ ██      ██▀▀▀█▄     ██      ██  ██  █   
 ██      ██  ██  ▄ ▀█▄▄ ██            ███     ██   ██ ██ ██      ██    ██    ██       ███ ███    
▄██▄     ▀█▄▄▀█▄ █▀▄▄█▀  ▀█▄▄▄▀        █     ▄██▄ ▄██ ██ ██▄    ▄██▄▄▄█▀    ▄██▄       █   █     
          ]],
      },
      sections = {
        { section = "header" },
        {
          text = {
            os.date("%a %d. %b %Y"),
            hl = "Comment",
          },
          align = "center",
          padding = 1,
        },
        {
          section = "terminal",
          cmd = "date +'%H:%M' | figlet -d /opt/homebrew/Cellar/toilet/0.3/share/figlet -f miniwi -c -w 60",
          hl = "QuickFixLine",
          padding = 1,
          height = 4,
          width = 60,
          align = "center",
        },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
