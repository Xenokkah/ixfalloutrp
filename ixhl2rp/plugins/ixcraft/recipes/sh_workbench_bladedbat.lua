RECIPE.name = "Bladed Wooden Bat"
RECIPE.description = "With a bit more mechanical know-how, secure some sawblades firmly to the end of a bat for extra damage."
RECIPE.model = "models/mosi/fallout4/props/weapons/melee/baseballbat.mdl"
RECIPE.category = "Melee Weapons"
RECIPE.requirements = {
	["woodbat"] = 1,
	["steel"] = 2,
	["adhesive"] = 2,
	["nails"] = 1,
	["screws"] = 1

}

RECIPE.results = {
	["bladedwoodbat"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)

	if (client:GetCharacter():GetRepair() < 25) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false
	
end)


