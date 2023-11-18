
AddCSLuaFile()

ENT.Base             = "base_gmodentity"
ENT.Type             = "anim"
ENT.PrintName        = "Maize"
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
        self:SetVar("bHarvestable", false)

        self:SetBodygroup(1,1)
      
        timer.Create( "Growtimer", 60, 1, function()  self:SetVar("bHarvestable", true) self:SetHarvestable(1) self:SetBodygroup(1,0) end )

        self:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
        local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then
            phys:Wake()
            phys:EnableMotion(false)
        end
    end
end


function ENT:SetupDataTables()
	self:NetworkVar( "Int", 0, "Watered" )
    self:NetworkVar( "Int", 0, "Fertilized" )
    self:NetworkVar( "Int", 0, "Harvestable" )
    self:NetworkVar( "String", "false", "Grown" )
 end



function ENT:Use(activator)
    if (activator:IsPlayer()) then

        local bHarvestable = self:GetVar("bHarvestable")
      
        
        if (bHarvestable == true) then
            local target = activator:GetCharacter()
            target:GetInventory():Add("maize", 1)
            target:GetInventory():Add("maizeseed", 1)
            activator:NewVegasNotify("You harvest some " .. self.PrintName .. ".", "messageNeutral", 5)
            activator:EmitSound("fosounds/fix/ui_items_generic_up_02.mp3")
            self:SetVar("bHarvestable", false)
            self:Remove()
            return
        end 


        if (bHarvestable == false) then

            if (self:GetWatered() == 3) then 
                activator:NewVegasNotify("You've given the plant enough water.", "messageNeutral", 5)
            else 
                self:SetWatered(self:GetWatered() + 1)
                activator:NewVegasNotify("You water the plant with some pure water.", "messageNeutral", 5)
                timer.Adjust("Growtimer", timer.TimeLeft("Growtimer") - 5)
            end 


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

        
        if (self:GetHarvestable() == 0 and self:GetWatered() < 3) then 
            local water = tooltip:AddRow("water")
            water:SetText("Interact to water with Purified Water to encourage quicker growth " .. self:GetWatered() .. "/3" )
            water:SetBackgroundColor(ix.config.Get("color"))
            water:SizeToContents()    
        end

        if (self:GetHarvestable() == 0 and self:GetWatered() >= 3) then 
            local fertilizer = tooltip:AddRow("fertilizer")
            fertilizer:SetText("Interact to apply Fertilizer for a bigger output " .. self:GetFertilized() .. "/3" )
            fertilizer:SetBackgroundColor(ix.config.Get("color"))
            fertilizer:SizeToContents()    
        end
      
    end
end