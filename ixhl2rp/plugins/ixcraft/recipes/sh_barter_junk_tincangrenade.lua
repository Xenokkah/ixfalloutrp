RECIPE.name = "Tin Can Grenade"
RECIPE.description = "Exchange a working alarm clock for a cheap but useful grenade."
RECIPE.model = "models/weapons/darky_m/rust/w_beancan.mdl"
RECIPE.category = "Junkers"
RECIPE.requirements = {
	["alarmclock"] = 1	
}

RECIPE.results = {
	["prewarmoney"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("barter", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_tradingpost")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)


