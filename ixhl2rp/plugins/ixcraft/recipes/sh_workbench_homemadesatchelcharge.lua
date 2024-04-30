RECIPE.name = "Homemade Satchel Charge"
RECIPE.description = "Assemble a homemade remote explosive."
RECIPE.model = "models/weapons/darky_m/rust/w_satchel.mdl"
RECIPE.category = "Explosives"
RECIPE.requirements = {
	["tincangrenade"] = 3,
	["leather"] = 2,
	["adhesive"] = 3,
	["circuitry"] = 3,


}

RECIPE.results = {
	["homemadesatchelcharge"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("explosives", 0) < 25) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)


