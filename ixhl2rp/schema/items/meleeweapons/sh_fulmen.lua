ITEM.name = "Fulmen"
ITEM.description = "A finely crafted spear made of steel. Forged by Legion blacksmiths and named after a thunderbolt, this spear is designed primarily for being hurled like a javelin. This will do the job nicely."
ITEM.model = "models/mosi/fallout4/props/weapons/melee/poolcue.mdl"
ITEM.class = "aus_m_spear_poolcue"
ITEM.weaponCategory = "melee"
ITEM.price = 5000
ITEM.flag = "1"
ITEM.height = 3
ITEM.width = 1
ITEM.category = "Melee"
ITEM.canAttach = false
ITEM.repairCost = ITEM.price/100*1
ITEM.weight = 3
ITEM.modifier = 5
ITEM.isPLWeapon = true
ITEM.Dmg = "1d10+2"
ITEM.Pen = 2
ITEM.Special = "UnBal, Tool"


function ITEM:OnInstanced(invID, x, y)
	if !self:GetData("durability") then
		self:SetData("durability", 10000)
	end
end

if (CLIENT) then
	function ITEM:PopulateTooltip(tooltip)
		if (self:GetData("equip")) then
			local name = tooltip:GetRow("name")
			name:SetBackgroundColor(derma.GetColor("Success", tooltip))
		end
	end
end