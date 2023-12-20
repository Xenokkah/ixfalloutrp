RECIPE.name = "Homebrew Nuka-Cola"
RECIPE.description = "Brew up a fresh bottle of a classic, emulating its recipe with post-war herbs and fruit. Requires at least one cap to seal the bottle."
RECIPE.model = "models/fnv/clutter/junk/sodabottleclosed01.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["barrelcactus"] = 1,
	["emptybottle"] = 1,
	["nevadaagave"] = 1,
}

RECIPE.results = {
	["nukacola"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 5) then 
		return false
	end 

	for _, v in ipairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	
	end
	return false
end)

RECIPE:PostHook("OnCanCraft", function(recipeTable, client)

	if client:GetCharacter():GetMoney() == 0 then
		return false, "You need at least one cap to seal the bottle."
	end
		
end)

RECIPE:PostHook("OnCraft", function(recipeTable, client)
	client:GetCharacter():SetMoney(client:GetCharacter():GetMoney() - 1)
	client:NewVegasNotify("You use one of your caps to seal up the bottle.", "messageNeutral", 4)
	return 
end)


