
AddCSLuaFile()

ENT.Base             = "base_gmodentity"
ENT.Type             = "anim"
ENT.PrintName        = "Water Spout"
ENT.Author            = "Scrat"
ENT.Category         = "Fallout Misc"
ENT.Spawnable = true
ENT.AdminOnly = true

if (SERVER) then
    function ENT:Initialize()
        self:SetModel("models/props_wasteland/prison_pipefaucet001a.mdl")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetUseType(SIMPLE_USE)
        self:SetVar("bHarvestable", true)
        local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then
            phys:Wake()
        end
    end
end

function ENT:Use(activator)
    if (activator:IsPlayer()) then
        local target = activator:GetCharacter()

        if (self:GetVar("bHarvestable") == false) then 
            activator:NewVegasNotify("Not enough water has been pumped to fill a bottle yet. The process takes roughly an hour.", "messageNeutral", 5)
            return
        end 

        if (target:GetInventory():HasItem("emptybottle")) then
            target:GetInventory():HasItem("emptybottle"):Remove()
            target:GetInventory():Add("waterclean", 1)
            activator:NewVegasNotify("You fill a bottle with refreshing, clean water.", "messageNeutral", 4)

            self:SetVar("bHarvestable", false)
            timer.Simple(3600, function() 
                self:SetVar("bHarvestable", true)
            end)

        else
            activator:NewVegasNotify("You need an empty bottle to fill with water.", "messageNeutral", 4)
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

        local descriptionfull = tooltip:AddRow("descriptionfull")
        descriptionfull:SetText("A spout connected to a groundwater reservoir, collecting and dispensing clean water." )
        descriptionfull:SetBackgroundColor(ix.config.Get("color"))
        descriptionfull:SizeToContents()    

    end
end