RECIPE.name = "Healing Poultice, Efficent"
RECIPE.description = "Create a pouch of Healing Poultice, using your refined skill in herbology to make the most of every ingredient."
RECIPE.model = "models/mosi/fnv/props/health/healingpowder.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["xanderroot"] = 1,
	["brocflower"] = 1,
	["nevadaagave"] = 1,
	["cavefungus"] = 1,
}

RECIPE.results = {
	["healingpoultice"] = 1
	

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 40) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
end)


