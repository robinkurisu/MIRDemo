
local ffi = require "ffi"

local demo_h = require "demo_h"
local format_value = demo_h.format_value

local botm_draw_menu = function(p_open)
    if ig.Begin("Demo: Callback Draw", p_open) then
        format_value("void __cdecl botm_draw_world();", " ")
        format_value("void __cdecl botm_draw();", " ")
        format_value("void __cdecl botm_draw_overlay();", " ")
        format_value("void __cdecl botm_draw_menu();", " ")
        format_value("void __cdecl botm_draw_foreground);", " ")
        ig.NewLine()
        ig.TextWrapped("Callback functions triggered on every frame. Use for rendering")
        ig.NewLine()
        ig.Text("Remarks:")
        ig.BulletText("botm_draw_world renders under game objects")
        ig.BulletText("botm_draw_overlay renders over the games hud")
        ig.BulletText("botm_draw stops being triggered if drawings are disabled")
        ig.BulletText("botm_draw_menu stops being triggered if the menu is closed")
    end 
    ig.End()

    if ig.Begin("Demo: Callback Draw Menu", nil, 0) then
        ig.Text("Hello from botm.draw_menu")
    end
    ig.End()
end

local botm_draw_world = function()
    local pos = player:Pos()
    local color = 0xffffffff
    graphics:DrawCircle3d(pos, 500, color, 64, 6)

    local pos = graphics:WorldToScreen(pos)
    graphics:DrawText2d(pos, color, "world")
end

local botm_draw = function()
    local pos = player:Pos()
    local color = 0xff00ffff
    graphics:DrawCircle3d(pos, 450, color, 64, 6)

    local pos = graphics:WorldToScreen(pos)
    pos.y = pos.y + 20
    graphics:DrawText2d(pos, color, "draw")

    local pos = game:CursorPos()
    local color = 0xffffffff
    graphics:DrawText2d(pos, color, "Hello from botm.draw")
end

local botm_draw_overlay = function()
    local pos = player:Pos()
    local color = 0xffffff00
    graphics:DrawCircle3d(pos, 400, color, 64, 6)

    local pos = graphics:WorldToScreen(pos)
    pos.y = pos.y + 40
    graphics:DrawText2d(pos, color, "overlay")
end

local botm_draw_foreground = function()
    local pos = player:Pos()
    local color = 0xffff00ff
    graphics:DrawCircle3d(pos, 350, color, 64, 6)

    local pos = graphics:WorldToScreen(pos)
    pos.y = pos.y + 60
    graphics:DrawText2d(pos, color, "foreground")
end


return {
    botm_draw_menu = botm_draw_menu,
    botm_draw_world = botm_draw_world,
    botm_draw = botm_draw,
    botm_draw_overlay = botm_draw_overlay,
    botm_draw_foreground = botm_draw_foreground,
}