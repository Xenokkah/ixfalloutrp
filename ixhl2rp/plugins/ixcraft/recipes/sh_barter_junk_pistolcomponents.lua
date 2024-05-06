RECIPE.name = "Pistol Ammo Components"
RECIPE.description = "Exchange a working camera for some useful components for hand-loading pistol ammo."
RECIPE.model = "models/mosi/fallout4/props/junk/tincan03.mdl"
RECIPE.category = "Junkers"
RECIPE.requirements = {
	["camera"] = 1	
}

RECIPE.results = {
	["casingsmallpistol"] = 2,
	["primersmallpistol"] = 2,
	["casinglargepistol"] = 1,
	["primerlargepistol"] = 1,
	["powderpistol"] = 2,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("barter", 0) < 20) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_tradingpost")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)


