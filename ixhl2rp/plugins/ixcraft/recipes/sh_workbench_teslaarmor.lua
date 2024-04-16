RECIPE.name = "Tesla Armoo"
RECIPE.description = "Convert a suit of metal armor into tesla armor. Tesla armor offers superior physical and energy resistance; a very solid piece of kit."
RECIPE.model = "models/thespireroleplay/items/clothes/group011.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["metalarmor"] = 1,
	["leatherupgrade3"] = 6,
    ["ballisticfiber"] = 2,
	["adhesive"] = 4,
    ["fuse"] = 4,
    ["gold"] = 8,
    ["silver"] = 4,
    ["copper"] = 8,
    ["militarycircuitry"] = 6,
}

RECIPE.results = {
	["teslaarmor"] = 1
}

RECIPE.blueprint = "teslaarmorblueprint"


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("science", 0) < 40) then
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)


