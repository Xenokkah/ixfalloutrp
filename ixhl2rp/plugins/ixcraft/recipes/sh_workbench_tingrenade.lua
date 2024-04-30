RECIPE.name = "Tin Can Grenade"
RECIPE.description = "Assemble a makeshift thrown explosive."
RECIPE.model = "models/weapons/darky_m/rust/w_beancan.mdl"
RECIPE.category = "Explosives"
RECIPE.requirements = {
	["adhesive"] = 1,
	["powderpistol"] = 2,
	["tincan"] = 2

}

RECIPE.results = {
	["tincangrenade"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("explosives", 0) < 15) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)


