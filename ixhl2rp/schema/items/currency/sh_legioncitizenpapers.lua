ITEM.name = "Caesar's Legion Citizenship Papers"
ITEM.model = "models/props_c17/paper01.mdl"
ITEM.description = "A set of papers signed and stamped by the Legion's Officio Civitas, or Citizenship Office, denoting the holder a registered Legion citizen, promising them safety and fair treatment in Legion-controlled areas, so long as their laws are followed and tributes paid."
ITEM.category = "currency"
ITEM.flag = "1"
ITEM.price = 0
ITEM.width = 1
ITEM.height = 1

ITEM.functions.use = {
	name = "Sign Citizenship Papers",
	icon = "icon64/tool.png",
	OnRun = function(item)
		
        item:SetData("owner", item.player:GetName())
        ix.chat.Send(item.player, "iteminternal", "signs the "..item.name..".", false)
        return false 
		
    end,
	OnCanRun = function(item)
        if !item:GetData("owner") then
		    return (!IsValid(item.entity))
        else
            return false
        end 
	end
}

function ITEM:GetDescription()
	if (!self.entity or !IsValid(self.entity)) then
		
        if self:GetData("owner") then
            return self.description .. "\n\n The signature at the bottom reads: " .. "\n" .. self:GetData("owner")

        else 
            return self.description .. "\n\n It still requires a signature at the bottom from the prospective Legion Citizen."
        end 

	else
		return self.description
	end
end
