ITEM.name = "Crimson Dragoon's Sword"
ITEM.description = "A Chinese 'jian' sword, issued to officers of the PLA before the war. Brought to the USA either by soldiers as trophies, or smuggled in by infiltrators.\nThis sword in particular belonged to one of the fearsome Crimson Dragoons. Tne centuries have not dulled its edge; even a slight cut is enough to cause profuse bleeding."
ITEM.model = "models/mosi/fallout4/props/weapons/melee/chineeseofficersword.mdl"
ITEM.class = "aus_m_chineseofficersword"
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