
AddCSLuaFile()

ENT.Base             = "base_gmodentity"
ENT.Type             = "anim"
ENT.PrintName        = "Dumpster"
ENT.Author            = "Scrat"
ENT.Category         = "Fallout Misc"
ENT.Spawnable = true
ENT.AdminOnly = true


if (SERVER) then
    function ENT:Initialize()
        self:SetModel("models/llama/dumpster.mdl")
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
        target = activator:GetCharacter()

        local bHarvested = self:GetVar("bHarvested")

        if (bHarvested == false) then
            local scrapqualitychance = math.random(1, 100)
            local repairboost = target:GetSkill("repair", 0)
            scrapqualitychance = scrapqualitychance + repairboost

            local scrapquantity = 1
            local scrapluckchance = math.random(1, 100) + target:GetAttribute("luck", 0)

            if scrapluckchance >= 80 then
                scrapquantity = 2
            end 

            if (scrapqualitychance >= 80) then
                target:GetInventory():Add("kitscrapboxadvanced", scrapquantity)
            else if (scrapqualitychance >= 50) then
                target:GetInventory():Add("kitscrapboxintermediate", scrapquantity)
            else 
                target:GetInventory():Add("kitscrapboxbasic", scrapquantity)
            end 

            activator:NewVegasNotify("You salvage some bits of scrap from the Dumpster.", "messageNeutral", 3)
            if scrapquantity > 1 then activator:NewVegasNotify("Lucky! You found more usable scrap that expected.", "messageNeutral", 2) end

            activator:EmitSound("fosounds/fix/ui_items_generic_up_02.mp3")
            self:SetVar("bHarvested", true)
            self:SetModel("models/llama/dumpsteropen.mdl")
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
    end
end
end 