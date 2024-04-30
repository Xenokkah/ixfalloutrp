RECIPE.name = "Bottlecap Mine"
RECIPE.description = "Create a makeshift IED with a lunchbox, some blastin' powder, and caps. Requires 10 caps."
RECIPE.model = "models/halokiller38/fallout/weapons/mines/bottlecapmine.mdl"
RECIPE.category = "Explosives"
RECIPE.requirements = {
	["lunchbox"] = 1,
	["circuitry"] = 3,
	["powderpistol"] = 3,
	["adhesive"] = 3,

}

RECIPE.results = {
	["bottlecapmine"] = 1
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

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	if client:GetCharacter():GetMoney() < 10 then
		return false, "You need at least ten caps to use for shrapnel."
	end
		
end)

RECIPE:PostHook("OnCraft", function(recipeTable, client)
	client:GetCharacter():SetMoney(client:GetCharacter():GetMoney() - 10)
	client:NewVegasNotify("You fill the lunchbox with 10 caps for use as shrapnel.", "messageNeutral", 4)
	return 
end)

