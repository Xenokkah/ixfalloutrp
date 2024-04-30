ITEM.name = "Umbra"
ITEM.description = "A machete gladius with a blackened steel blade that seems to consume all light that hits it. \n\nDamage: 30  + STR, -5 DT\nLooming Darkness: Attacks that do more than Minimum damage reduces target's AP by half for their next 2 turns"
ITEM.model = "models/halokiller38/fallout/weapons/melee/machetegladius.mdl"
ITEM.class = "aus_m_machete"
ITEM.weaponCategory = "melee"
ITEM.price = 5000
ITEM.flag = "1"
ITEM.height = 2
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