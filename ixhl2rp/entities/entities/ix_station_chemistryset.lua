AddCSLuaFile()

ENT.Base            = "base_ai"
ENT.Type            = "anim"
ENT.PrintName        = "Chemistry Set"
ENT.Author            = "Ultra"
ENT.Category         = "Helix"

ENT.AutomaticFrameAdvance = true
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.HUDName = "Chemistry Set"
ENT.HUDDesc = "A chemistry set."

if (SERVER) then
    function ENT:Initialize()
        self:SetModel("models/mosi/fallout4/furniture/workstations/chemistrystation01.mdl")
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
        title:SetText("Chemistry Set")
        title:SetBackgroundColor(ix.config.Get("color"))
        title:SizeToContents()
    
        local description = tooltip:AddRow("description")
        description:SetText("A set of beakers, burners, tubes, and flasks suitable for chemical creations.")
        description:SizeToContents()
    
    end
end