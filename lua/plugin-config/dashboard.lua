local status, db = pcall(require,"dashboard")
if not status then
  vim.notify("没有找到 dashboard")
  return
end

db.custom_footer = {
  "",
  "",
  "College of Science & Engineering JNU",
}

db.custom_center={
  {
  icon = "  ",
  desc = "Projects                            ",
  action = "Telescope projects",
},
{
  icon = "  ",
  desc = "Recently files                      ",
  action = "Telescope oldfiles",
},
{   icon = "  ",
desc = "Find file                           ",
action = "Telescope find_files",
},
{
icon = "  ",
desc = "Find text                           ",
action = "Telescopecope live_grep",},
}

db.custom_header = {
[[]],
[[██╗   ██╗ ██████╗ ███████╗]],
[[╚██╗ ██╔╝██╔════╝ ╚══███╔╝]],
[[ ╚████╔╝ ██║  ███╗  ███╔╝ ]],
[[  ╚██╔╝  ██║   ██║ ███╔╝  ]],
[[   ██║   ╚██████╔╝███████╗]],
[[   ╚═╝    ╚═════╝ ╚══════╝]],
[[                          ]],
}
