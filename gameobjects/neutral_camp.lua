
local ffi = require "ffi"

local demo_h = require "demo_h"
local format_value = demo_h.format_value

local game_object = require "gameobjects/api_game_object"

local open_game_object = ffi.new("bool[1]")
local camp_index = ffi.new("int[1]")
camp_index[0] = 1

local botm_draw_menu = function(p_open)
    local obj
    if ig.Begin("Demo: NeutralCamp", p_open) then

        local neutral_camps = object_manager:NeutralCamps()
        ig.SliderInt("##SliderNeutralCamp", camp_index, 1, #neutral_camps, "neutral_camp[%d]", 0)
        obj = neutral_camps[camp_index[0]]

        if obj then
            ig.NewLine()
            ig.Checkbox("GameObject interface", open_game_object)
            ig.NewLine()
            format_value("NeutralCamp:", obj)
            format_value("\tcamp_id()", obj:CampId())
            format_value("\tcamp_type()", obj:CampType())
            format_value("\tcamp_team()", obj:CampTeam())
            format_value("\tobjects()", obj:Objects())
            local objects = obj:Objects()
            for i, v in ipairs(objects) do
                format_value("\t\t["..i.."]", v)
            end
            format_value("\tis_alive()", obj:IsAlive())
            format_value("\tspawn_time()", obj:SpawnTime())
            format_value("\tfnv_hash()", obj:FnvHash(), "0x%x")
            -- if obj:FnvHash() ~= game:FnvHash(obj:Name()) then
            --     ig.TextColored(0xff00ffff, "\tFnvHash mismatch")
            -- end
        end
    end
    ig.End()

    if open_game_object[0] then
        game_object.draw_menu(obj, "NeutralCamp", open_game_object)
    end
end

return {
    botm_draw_menu = botm_draw_menu,
}