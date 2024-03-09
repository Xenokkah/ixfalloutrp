RECIPE.name = "12.7mm Breakdown"
RECIPE.description = "Disassemble some 12.7mmm."
RECIPE.model = "models/illusion/fwp/127ammobox.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["ammo_127ammo"] = 1
}

RECIPE.results = {
	["leadcan"] = 3,
	["casinglargepistol"] = 1,
	["powderpistol"] = 2,
	["primerlargepistol"] = 3,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end
	return false
end)


