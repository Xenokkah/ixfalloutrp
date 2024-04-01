RECIPE.name = "Wasteland Wayfarer"
RECIPE.description = "Add to a set of leather armor with extra layers for a sturdier set of apparel while still remaining light and breezy."
RECIPE.model = "models/thespireroleplay/items/clothes/group015.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["leatherarmor"] = 1,
	["leatherupgrade1"] = 2,
	["cloth"] = 2,
	["leather"] = 2,
	["adhesive"] = 4,
}

RECIPE.results = {
	["wastelandwayfarer"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 15) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)


