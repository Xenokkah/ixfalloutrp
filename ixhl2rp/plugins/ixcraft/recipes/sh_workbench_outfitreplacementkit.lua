RECIPE.name = "Outfit Repair and Replacement Kit"
RECIPE.description = "Assemble a box of replacement armor plates and parts for heavily damaged suits."
RECIPE.model = "models/mosi/fallout4/props/junk/modcrate.mdl"
RECIPE.category = "Armor Repair"
RECIPE.requirements = {
	["adhesive"] = 3,
	["steel"] = 2,
	["ceramic"] = 2,
	["leather"] = 2,
	["aluminum"]= 2,
	["cloth"] = 2,
	["leather"] = 2,
}

RECIPE.blueprint = "armorrepairblueprint"

RECIPE.results = {
	["outfitreplacementkit"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 20) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)


