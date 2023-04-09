ITEM.name = "Mask"
ITEM.description = "A face covering."
ITEM.longdesc = "A cloth facial mask for hiding one's identity. Obscures name and description when looked at if equipped, and hides from scoreboard - but not when speaking or doing actions."
ITEM.model = "models/fallout/apparel/bandana.mdl"
ITEM.price = 15000
ITEM.width = 2
ITEM.height = 1

function ITEM:OnEquipped()
    self.player:SetNetVar("isMasked",true)
end
 
function ITEM:OnUnequipped()
    self.player:SetNetVar("isMasked",false)
end
