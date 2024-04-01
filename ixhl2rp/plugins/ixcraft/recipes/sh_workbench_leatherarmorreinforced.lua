RECIPE.name = "Leather Armor, Reinforced"
RECIPE.description = "Further improve a set of Wasteland Wayfarer armor with some extra heat-resistant layers, plus some ballistic fibers to add some proper kevlar, but the result is a tad heavier."
RECIPE.model = "models/thespireroleplay/items/clothes/group052.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["wastelandwayfarer"] = 1,
	["leatherupgrade2"] = 2,
	["cloth"] = 2,
	["ballisticfiber"] = 2,
	["adhesive"] = 4,
}

RECIPE.results = {
	["leatherarmorreinforced"] = 1
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


