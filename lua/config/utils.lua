local M = {}

function M.getProject()
  local project_file_path = vim.fn.findfile(".project.lua", ".;")
  if project_file_path == "" then
    return nil
  end
  -- if project_file_path is an array, get the first element of the array
  if type(project_file_path) == "table" then
    project_file_path = project_file_path[1]
  end
  local project_file = dofile(project_file_path)

  return project_file
end

M.org_mapper = {
  ["personal"] = "\u{f415} Personal",
  ["bekk"] = "\u{f491} Bekk",
  [".config"] = "\u{e615} Config",
  ["teoria"] = "\u{f187} Teoria",
  ["etc"] = "\u{f313} NixOS",
  default = "\u{f128} UNKNOWN",
}

M.org_colors = {
  ["personal"] = "OrgPersonal",
  ["bekk"] = "OrgBekk",
  [".config"] = "OrgConfig",
  ["etc"] = "OrgNixOS",
  ["teoria"] = "OrgTeoria",
  default = "OrgDefault",
}

return M
