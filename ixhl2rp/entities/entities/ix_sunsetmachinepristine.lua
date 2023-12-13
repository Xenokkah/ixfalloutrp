
AddCSLuaFile()

ENT.Base             = "base_gmodentity"
ENT.Type             = "anim"
ENT.PrintName        = "Pristine Sunset Sarsaparilla Vending Machine"
ENT.Author            = "Scrat"
ENT.Category         = "Fallout Misc"
ENT.Spawnable = true
ENT.AdminOnly = true

if (SERVER) then
    function ENT:Initialize()
        self:SetModel("models/mosi/fnv/props/vending/sunsetsasparilla_machine.mdl")
        self:SetSkin(1)
        self:PhysicsInit(SOLID_VPHYSICS)
        self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_VPHYSICS)
        self:SetUseType(SIMPLE_USE)
        self:SetVar("Stock", 12)
        local phys = self:GetPhysicsObject()
        if (phys:IsValid()) then
            phys:Wake()
        end
    end
end

function ENT:Use(activator)
    if (activator:IsPlayer()) then
        local target = activator:GetCharacter()

        if (self:GetVar("Stock") == 0) then 
            activator:NewVegasNotify("This machine has been cleared of all its stock.", "messageNeutral", 5)
            return
        end 

        if (target:GetInventory():HasItem("prewarmoney")) then
            target:GetInventory():HasItem("prewarmoney"):Remove()
            activator:NewVegasNotify("You deposit dollar bills, and the machine dispenses a bottle immediately.", "messageNeutral", 5)
            activator:EmitSound("fosounds/fix/ui_items_bottlecaps_up_03.mp3")
        
            self:SetVar("Stock", self:GetVar("Stock") - 1)
            target:GetInventory():Add("sunsetsarsaparillacold", 1)

        else
            activator:NewVegasNotify("You need a stack of pre-war money to purchase a drink.", "messageNeutral", 5)
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
        descriptionfull:SetText("A fully functional Sunset Sarsaparilla machine with bottles still inside, ready to dispense the classic root beer of the west, ice cold. Uses pre-war money." )
        descriptionfull:SetBackgroundColor(ix.config.Get("color"))
        descriptionfull:SizeToContents()    

    end
end