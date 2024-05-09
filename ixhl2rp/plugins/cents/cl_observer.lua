local FNFF_CE = PLUGIN

local dimDistance = 1024
local nameDimDistance = 2048
local aimLength = 128
local barHeight = 14

function FNFF_CE:HUDPaint()
    local client = LocalPlayer()

    if (ix.option.Get("observerESP", true) and client:GetMoveType() == MOVETYPE_NOCLIP and
        !client:InVehicle() and CAMI.PlayerHasAccess(client, "Helix - Observer", nil)) then
        local scrW, scrH = ScrW(), ScrH()

        for _, v in ipairs(ents.GetAll()) do
            if !v.combatEntity then
                continue
            end

            local entPos = v:GetPos() + Vector(0, 0, (v:OBBCenter().z * 1.7))
            local screenPosition = entPos:ToScreen()

            local marginX, marginY = scrH * .05, scrH * .05
            local x, y = math.Clamp(screenPosition.x, marginX, scrW - marginX), math.Clamp(screenPosition.y, marginY, scrH - marginY)

            local distance = client:GetPos():Distance(v:GetPos())
            local factor = 1 - math.Clamp(distance / dimDistance, 0, 1)
            local nameFactor = 1 - math.Clamp(distance / nameDimDistance, 0, 1)
            local size = math.max(25, 32 * factor)
            local nameSize = math.max(20, 22 * nameFactor)
            local alpha = math.max(255 * factor, 0)
            local nameAlpha = math.max(255 * nameFactor, 150)
            local aimAlpha = (1 - factor * 1.5) * 80

            surface.SetDrawColor(255, 255, 255, alpha)
            surface.SetFont("ixGenericFont")
            
            local text = "(CEnt) " .. v:Name()
            local inObserver
            local textWidth, textHeight = surface.GetTextSize(text)
            local barWidth = math.Clamp(textWidth, 0, textWidth)

            -- we can assume that if we're using cheap blur, we'd want to save some fps here
            if (!ix.option.Get("cheapBlur", false)) then
                local data = {}
                data.start = client:EyePos()
                data.endpos = v:EyePos()
                data.filter = {client, v}

                if (util.TraceLine(data).Hit) then
                    aimAlpha = alpha
                else
                    aimAlpha = (1 - factor * 4) * 80
                end
            end

            surface.SetDrawColor(0, 0, 0, nameAlpha)
            surface.DrawRect(x - textWidth / 2, y - nameSize - barHeight / 2, textWidth, barHeight, Color(0, 0, 0, 255))
            surface.SetDrawColor(46, 247, 39, nameAlpha)
            surface.DrawRect( x - barWidth / 2, y - nameSize - barHeight / 2, barWidth, barHeight, Color(46, 247, 39, 255))

            local nameColor = v:IsTurn() and Color(51, 240, 60) or Color(230, 100, 100)
            ix.util.DrawText(text, x, y - nameSize * 2, ColorAlpha(nameColor, nameAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, nameAlpha)
        end
    end 
end