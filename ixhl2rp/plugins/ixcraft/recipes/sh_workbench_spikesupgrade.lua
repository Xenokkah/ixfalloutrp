RECIPE.name = "Armor Spikes"
RECIPE.description = "Follow the guide created by the Sensih tribe to craft a set of armor spikes for your suit that can turn the tables on melee attackers."
RECIPE.model = "models/weapons/w_suitcase_passenger.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["steel"] = 5,
	["screws"] = 5,
	["adhesive"] = 4,
}

RECIPE.results = {
	["spikesupgrade"] = 1
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


