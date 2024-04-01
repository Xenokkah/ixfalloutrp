RECIPE.name = "Sewing Kit"
RECIPE.description = "Fashion a sewing kit for use in restoring medium damage to worn gear."
RECIPE.model = "models/mosi/fallout4/props/junk/ammobag.mdl"
RECIPE.category = "Weapon Repair"
RECIPE.requirements = {
	["adhesive"] = 2,
	["cloth"] = 2,
	["leather"] = 2,
	["asbestos"] = 1,
}

RECIPE.blueprint = "armorrepairblueprint"

RECIPE.results = {
	["outfitsewingkit"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)


