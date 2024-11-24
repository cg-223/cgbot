--metadata @ steamodded-metadata.json
local function sort_string_helper(a, b)
    for i = 1, ((#a > #b) and #b) or #a do
        if string.byte(string.sub(a, i, i)) < string.byte(string.sub(b, i, i)) then
            return true
        elseif string.byte(string.sub(a, i, i)) > string.byte(string.sub(b, i, i)) then
            return false
        end
    end
    return ((#a < #b) and true) or false
end


local path = SMODS.current_mod.path
path = path .. "modules/"

local modules = NFS.getDirectoryItems(path)
table.sort(modules, sort_string_helper)

--sort the modules to load in alphabetical order (theyre all numbers aligned to the right, followed by one of tildes)

for i, v in pairs(modules) do
    local pth = path .. v
    loadfile(pth) ()
end