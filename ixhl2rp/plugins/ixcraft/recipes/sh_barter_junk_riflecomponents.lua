RECIPE.name = "Rifle Ammo Components"
RECIPE.description = "Exchange a buttercup toy for some useful components for hand-loading rifle ammo."
RECIPE.model = "models/mosi/fallout4/props/junk/tincan03.mdl"
RECIPE.category = "Junkers"
RECIPE.requirements = {
	["buttercuptoy"] = 1	
}

RECIPE.results = {
	["casingsmallrifle"] = 2,
	["primersmallrifle"] = 2,
	["casinglargerifle"] = 1,
	["primerlargerifle"] = 1,
	["powderrifle"] = 2,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("barter", 0) < 30) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_tradingpost")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)


