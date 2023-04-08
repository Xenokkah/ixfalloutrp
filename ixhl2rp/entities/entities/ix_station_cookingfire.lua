AddCSLuaFile()

ENT.Base            = "base_ai"
ENT.Type            = "anim"
ENT.PrintName        = "Cooking Campfire"
ENT.Author            = "Ultra"
ENT.Category         = "Helix"

ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.HUDName = "Cooking Campfire"
ENT.HUDDesc = "A campfire that can cook."

if (SERVER) then
    function ENT:Initialize()
        self:SetModel("models/mosi/fnv/props/workstations/campfire05.mdl")
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
        title:SetText("Cooking Campfire")
        title:SetBackgroundColor(ix.config.Get("color"))
        title:SizeToContents()
    
        local description = tooltip:AddRow("description")
        description:SetText("A campfire with a cooking pot suspended over the fire with chain, making it suitable for not only warmth but cooking too.")
        description:SizeToContents()
    
    end
end