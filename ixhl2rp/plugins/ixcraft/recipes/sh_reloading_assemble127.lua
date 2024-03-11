RECIPE.name = "12.7mm"
RECIPE.description = "Hand-load some 12.7mmm."
RECIPE.model = "models/illusion/fwp/127ammobox.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["leadcan"] = 3,
	["casinglargepistol"] = 1,
	["powderpistol"] = 3,
	["primerlargepistol"] = 2,
}

RECIPE.results = {
	["ammo_127mmammo"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 30) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end
	return false
end)


