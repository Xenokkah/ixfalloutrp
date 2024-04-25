AddCSLuaFile()

ENT.Base            = "base_ai"
ENT.Type            = "anim"
ENT.PrintName        = "Trading Post"
ENT.Author            = "Ultra"
ENT.Category         = "Helix"

ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.HUDName = "Trading Post"
ENT.HUDDesc = "A trading post."

if (SERVER) then
    function ENT:Initialize()
        self:SetModel("models/vex/seventysix/vending/playervendingmachine.mdl")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetUseType(SIMPLE_USE)

        local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then
            phys:Wake()
        end
    end
end


if (CLIENT) then
    function ENT:OnPopulateEntityInfo(tooltip)
        surface.SetFont("ixIconsSmall")
    
        local title = tooltip:AddRow("name")
        title:SetImportant()
        title:SetText("Trading Post")
        title:SetBackgroundColor(ix.config.Get("color"))
        title:SizeToContents()
    
        local description = tooltip:AddRow("description")
        description:SetText("A wasteland vending machine useful for exchanging goods and services.")
        description:SizeToContents()
    
    end
end