RECIPE.name = "Metal Armor, Reinforced"
RECIPE.description = "Reinforce a set of metal armor. Reinforced metal armor incorporates material protective against ballistic threats and further strengthens the metal plating."
RECIPE.model = "models/thespireroleplay/items/clothes/group011.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["metalarmor"] = 1,
    ["metalupgrade3"] = 2,
	["leatherupgrade2"] = 1,
    ["ballisticfiber"] = 2,
	["adhesive"] = 4,
}

RECIPE.results = {
	["metalarmorreinforced"] = 1
}

RECIPE.blueprint = "blueprintmetalarmorreinforced"


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 35) then
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)


