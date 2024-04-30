RECIPE.name = "Metal Armor"
RECIPE.description = "Assemble a set of heavy but effective metal armor."
RECIPE.model = "models/thespireroleplay/items/clothes/group011.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["metalupgrade2"] = 2,
	["steel"] = 4,
	["leatherupgrade2"] = 2,
	["adhesive"] = 4,
}

RECIPE.results = {
	["metalarmor"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 25) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)


