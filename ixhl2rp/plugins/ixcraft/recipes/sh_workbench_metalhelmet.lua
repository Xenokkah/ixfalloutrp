RECIPE.name = "Metal Helmet"
RECIPE.description = "Assemble a metal helmet. Metal armor is very heavy, but is solid and dependable against physical threats."
RECIPE.model = "models/fallout/apparel/helmetmetalarmor.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["metalupgrade2"] = 1,
	["leatherupgrade1"] = 1,
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


