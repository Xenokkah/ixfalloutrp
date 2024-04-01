RECIPE.name = "Wasteland Tequila"
RECIPE.description = "A whiskey bottle filled with a homemade remedy for any poisons that you might encounter on the road, from a Nightstalker’s bite to a Cazador’s sting, this stuff will make you forget you were even poisoned. Drink enough of it and it’ll even make you forget you were doing."
RECIPE.model = "models/fnv/clutter/liquorbottles/whiskeybottle01.mdl"
RECIPE.category = "Chems"
RECIPE.requirements = {
	["emptybottle"] = 1,
	["nevadaagave"] = 2,
	["waterclean"] = 2,

}

RECIPE.results = {
	["wastelandtequila"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 20) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)


