
AddCSLuaFile()

ENT.Base             = "base_gmodentity"
ENT.Type             = "anim"
ENT.PrintName        = "Domestic Cave Fungus"
ENT.Author            = "Scrat"
ENT.Category         = "Fallout Farming"
ENT.Spawnable = true
ENT.AdminOnly = true

if (SERVER) then
    function ENT:Initialize()
        self:SetModel("models/mosi/fnv/props/plants/cavefungus.mdl")
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetUseType(SIMPLE_USE)
    
        self:SetNetVar("bHarvestable", false)
        self:SetNetVar("bFertilized", false)
        self:SetNetVar("Watered", 0)
        self:SetBodygroup(1,1)
        self:SetNetVar("TimerName", "Growtimer" .. math.random(0, 999))
      
        timer.Create( self:GetNetVar("TimerName"), 5400, 1, function()  self:SetNetVar("bHarvestable", true) self:SetBodygroup(1,0) end )

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

        local bHarvestable = self:GetNetVar("bHarvestable")
        local Watered = self:GetNetVar("Watered")
        local Fertilized = self:GetNetVar("bFertilized")
      
        
        if (bHarvestable == true) then
            local target = activator:GetCharacter()

            if Fertilized == true then
                target:GetInventory():Add("cavefungus", 4)
            else
                target:GetInventory():Add("cavefungus", 2)
            end 

            local seedchance = math.random(1, 100)
            local survivalboost = activator:GetCharacter():GetSkill("survival", 0)
            seedchance = seedchance + survivalboost
            if (seedchance >= 65) then target:GetInventory():Add("seedcavefungus", 1) end
       
            activator:NewVegasNotify("You harvest some " .. self.PrintName .. ".", "messageNeutral", 5)
            activator:EmitSound("fosounds/fix/ui_items_generic_up_02.mp3")
            self:SetVar("bHarvestable", false)
            self:Remove()
            return

        elseif Watered < 3 then 
            activator:Notify(self.PrintName .. " will be ready for havest in " .. math.floor(timer.TimeLeft(self:GetNetVar("TimerName"))) .. " seconds.")
            activator:requestQuery("Add Water?", "Water the plant with Purified Water to make it grow quicker?", function(text)
                if text then
                    
                    local target = activator:GetCharacter()
                    if (target:GetInventory():HasItem("waterclean")) then 
                        target:GetInventory():HasItem("waterclean"):Remove()
                        activator:NewVegasNotify("You water the plant with some pure water.", "messageNeutral", 3)
                        timer.Adjust(self:GetNetVar("TimerName"), timer.TimeLeft(self:GetNetVar("TimerName")) - 600)
                        self:SetNetVar("Watered", Watered + 1)

                    else
                        activator:NewVegasNotify("You need a bottle of purified water.", "messageSad", 3)
                    end 

                end
            end)

        elseif Watered >= 3 and Fertilized == false then
            activator:Notify(self.PrintName .. " will be ready for havest in " .. math.floor(timer.TimeLeft(self:GetNetVar("TimerName"))) .. " seconds.")
            activator:requestQuery("Add Fertilizer?", "Add fertilizer to increase crop yield?", function(text)
                if text then
                    
                    local target = activator:GetCharacter()
                    if (target:GetInventory():HasItem("fertilizer")) then 
                        target:GetInventory():HasItem("fertilizer"):Remove()
                        activator:NewVegasNotify("You add fertilizer to the plant, increasing its eventual yield.", "messageNeutral", 3)
                        self:SetNetVar("bFertilized", true)

                    else
                        activator:NewVegasNotify("You need a portion of Fertilizer.", "messageSad", 3)
                    end 

                end
            end)
        else 
            activator:Notify(self.PrintName .. " will be ready for havest in " .. math.floor(timer.TimeLeft(self:GetNetVar("TimerName"))) .. " seconds.")
        end 
        


    end 
end

if (CLIENT) then
    function ENT:OnPopulateEntityInfo(tooltip)
        surface.SetFont("ixIconsSmall")
       
        local bHarvestable = self:GetNetVar("bHarvestable")
        local Watered = self:GetNetVar("Watered")
        local Fertilized = self:GetNetVar("bFertilized")

        local title = tooltip:AddRow("name")
        title:SetImportant()
        title:SetText(self.PrintName)
        title:SetBackgroundColor(ix.config.Get("color"))
        title:SizeToContents()    

        if bHarvestable == true then 
            local water = tooltip:AddRow("water")
            water:SetText("Ready For Harvest!" )
            water:SetBackgroundColor(ix.config.Get("color"))
            water:SizeToContents()    
        end

        if bHarvestable == false and Watered < 3 then 
            local water = tooltip:AddRow("water")
            water:SetText("Interact To Water Plant: "..Watered .. "/3" )
            water:SetBackgroundColor(ix.config.Get("color"))
            water:SizeToContents()    
        end

        if bHarvestable == false and Watered >= 3 and Fertilized == false then
            local water = tooltip:AddRow("water")
            water:SetText("Interact To Feed Plant With Fertilizer")
            water:SetBackgroundColor(ix.config.Get("color"))
            water:SizeToContents()    
        end
      
    end
end
