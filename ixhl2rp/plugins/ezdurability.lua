local PLUGIN = PLUGIN
PLUGIN.name = "EZ Durability"
PLUGIN.author = "Scrat Knapp"
PLUGIN.desc = "Allows admins easy access to manage suit durability with commands."

local playerMeta = FindMetaTable("Player")

function playerMeta:DamageArmor(target, damage)
	local inventory = target:GetInv()
	local resItems = {} 
	local str = ""

	for k, v in pairs (inventory:GetItems()) do
		if(!v:GetData("equip", false)) then continue end --ignores unequipped items
		
		local res = v.isArmor
		if (res) then
			table.insert(resItems, v)
		end
	end


	if next(resItems) == nil then 
		str = str.. target:GetName().. " has no suit equipped."
		return str
	end 

	for k, v in pairs(resItems) do
		local curDT = v:GetData("dT") 
		local curET = v:GetData("eT") 
		local curDR = v:GetData("dR") 

		local maxDT = v:GetData("maxDt")
		local maxET = v:GetData("maxEt")
		local maxDR = v:GetData("maxDr")

		if (curDT) then
			local newDT = curDT - damage 

			v:SetData("dT", math.Clamp(newDT, 0, maxDT))
			target:SetChardt(target:GetChardt() - damage)
		end 

		if (curET) then 
			local newET = curET - damage 
			v:SetData("eT", math.Clamp(newET, 0, maxET))
			target:SetCharet(target:GetCharet() - damage)
		end 

		if (curDR) then
			local newDR = curDR - damage 
			v:SetData("dR", math.Clamp(newDR, 0, maxDR))
			target:SetChardr(target:GetChardr() - damage)
		end 
		
		str = str.. "\nReduced the damage protection values of the " .. v.name.. " equipped by " ..target:GetName().. " by " .. damage
	end

	return str
end

function playerMeta:RepairArmor(target, repair)
	local inventory = target:GetInv()
	local resItems = {} 
	local str = ""

	for k, v in pairs (inventory:GetItems()) do
		if(!v:GetData("equip", false)) then continue end --ignores unequipped items
		
		local res = v.isArmor
		if (res) then
			table.insert(resItems, v)
		end
	end

	if next(resItems) == nil then 
		str = str.. target:GetName().. " has no suit equipped."
		return str

	end 

	for k, v in pairs(resItems) do
		local curDT = v:GetData("dT")
		local curET = v:GetData("eT")
		local curDR = v:GetData("dR")

		local maxDT = v:GetData("maxDt")
		local maxET = v:GetData("maxEt")
		local maxDR = v:GetData("maxDr")

		
		if (curDT) then
			local newDT = curDT + repair
			v:SetData("dT", math.Clamp(newDT, 0, maxDT))
			target:SetChardt(target:GetChardt() + repair)
		end 

		if (curET) then 
			local newET = curET + repair
			v:SetData("eT", math.Clamp(newET, 0, maxET))
			target:SetCharet(target:GetCharet() + repair)
		end 

		if (curDR) then
			local newDR = curDR + repair
			v:SetData("dR", math.Clamp(newDR, 0, maxDR))
			target:SetChardr(target:GetChardr() + repair)
		end 

		str = str.. "Increased the damage protection values of the " .. v.name.. " equipped by " ..target:GetName().. " by " .. repair
	end
	return str
end


ix.command.Add("CharDamageArmor", {
	description = "Damage a characters currently equipped armor durability by the given amount.",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.number,
	},
	OnRun = function(self, client, target, damage)
		return target:GetPlayer():DamageArmor(target, damage)
	end
})

ix.command.Add("Charrepairarmor", {
	description = "Repair a characters currently equipped armor durability by the given amount.",
	adminOnly = true,
	arguments = {
		ix.type.character,
		ix.type.number,
	},
	OnRun = function(self, client, target, repair)
		return target:GetPlayer():RepairArmor(target, repair)
	end
})


