
AddCSLuaFile()

ENT.Base             = "base_gmodentity"
ENT.Type             = "anim"
ENT.PrintName        = "Wild Maize"
ENT.Author            = "Scrat"
ENT.Category         = "Fallout Harvestables"
ENT.Spawnable = true
ENT.AdminOnly = true


if (SERVER) then
    function ENT:Initialize()
        self:SetModel("models/mosi/fnv/props/plants/maize.mdl")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetUseType(SIMPLE_USE)
        self:SetVar("bHarvestable", true)
        self:SetVar("watered", 0)
        self:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
        local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then
            phys:Wake()
            phys:EnableMotion(false)
        end
    end
end



function ENT:Use(activator)
    if (activator:IsPlayer()) then

        local bHarvestable = self:GetVar("bHarvestable")
        
        if (bHarvestable == true) then
            local target = activator:GetCharacter()
            target:GetInventory():Add("maize", 1)
            target:GetInventory():Add("maizeseed", 1)
            self:SetVar("bHarvestable", false)
            activator:NewVegasNotify("You pick some " .. self.PrintName .. ".", "messageNeutral", 5)
            activator:EmitSound("fosounds/fix/ui_items_generic_up_02.mp3")
            self:SetBodygroup(1,1)

            timer.Simple(15, function() 
                self:SetVar("bHarvestable", true)
                self:SetBodygroup(1,0)
            end)

            return
        end 


        if (bHarvestable == false) then
            activator:NewVegasNotify("You water the plant with some pure water.", "messageNeutral", 5)
            self:SetVar("watered", self:GetVar("watered") + 1)
            
        end
    end 
end

if (CLIENT) then
    function ENT:OnPopulateEntityInfo(tooltip)
        surface.SetFont("ixIconsSmall")
    
        local title = tooltip:AddRow("name")
        title:SetImportant()
        title:SetText(self.PrintName)
        title:SetBackgroundColor(ix.config.Get("color"))
        title:SizeToContents()    

        local water = tooltip:AddRow("water")
        water:SetText("Interact to water with Purified Water" .. self:GetVar("watered") .. "/3" )
        water:SetBackgroundColor(ix.config.Get("color"))
        water:SizeToContents()    
    end
end