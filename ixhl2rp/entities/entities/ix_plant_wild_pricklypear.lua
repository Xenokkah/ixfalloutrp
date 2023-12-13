
AddCSLuaFile()

ENT.Base             = "base_gmodentity"
ENT.Type             = "anim"
ENT.PrintName        = "Wild Prickly Pear Fruit"
ENT.Author            = "Scrat"
ENT.Category         = "Fallout Harvestables"
ENT.Spawnable = true
ENT.AdminOnly = true


if (SERVER) then
    function ENT:Initialize()
        self:SetModel("models/mosi/fnv/props/plants/pricklypearcactus.mdl")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetUseType(SIMPLE_USE)
        self:SetVar("bHarvested", false)
        local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then
            phys:Wake()
        end
    end
end



function ENT:Use(activator)
    if (activator:IsPlayer()) then

        local bHarvested = self:GetVar("bHarvested")
        
        if (bHarvested == false) then
            target = activator:GetCharacter()
            target:GetInventory():Add("pricklypear", 1)
            self:SetVar("bHarvested", true)
            activator:NewVegasNotify("You pick a Prickly Pear fruit.", "messageNeutral", 5)
            activator:EmitSound("fosounds/fix/ui_items_generic_up_02.mp3")
            self:SetBodygroup(1,1)
            return
        end 
    end 
end

if (CLIENT) then
    function ENT:OnPopulateEntityInfo(tooltip)
        surface.SetFont("ixIconsSmall")
    
        local title = tooltip:AddRow("name")
        title:SetImportant()
        title:SetText("Prickly Pear Cactus")
        title:SetBackgroundColor(ix.config.Get("color"))
        title:SizeToContents()    
    end
end