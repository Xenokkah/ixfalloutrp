RECIPE.name = "Sterilize Used Syringe"
RECIPE.description = "Thoroughly sterilize a used syringe, making it safe to re-use."
RECIPE.model = "models/fnv/clutter/hospital/surgicalsyringe01.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["dirtysyringe"] = 1,
	["antiseptic"] = 1,
}

RECIPE.results = {
	["emptysyringe"] = 1
	

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false
	
end)


