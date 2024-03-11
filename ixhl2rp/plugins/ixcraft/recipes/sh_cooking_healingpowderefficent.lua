RECIPE.name = "Healing Powder, Efficent"
RECIPE.description = "Your survival knowledge grants you a much more efficent way of processing these herbs into powder."
RECIPE.model = "models/mosi/fnv/props/health/healingpowder.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["xanderroot"] = 1,
	["brocflower"] = 1,
}

RECIPE.results = {
	["healingpowder"] = 1
	

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 20) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
end)


