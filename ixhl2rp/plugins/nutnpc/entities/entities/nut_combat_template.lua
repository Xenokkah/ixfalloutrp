-- "gamemodes\\halorp\\plugins\\combat\\entities\\entities\\nut_combat_template.lua"

ENT.Type = "nextbot"

ENT.Base = "nut_combat"

ENT.PrintName = "CENT Template"

ENT.Category = "ixScript - Combat"

ENT.Spawnable = true

ENT.AdminOnly = true

ENT.model = "models/Humans/Group01/male_07.mdl"

ENT.name = "Shane Walsh"

ENT.desc = "A newly spawned CENT just dying to stand idle and watch."

ENT.hp = 100

ENT.armor = 0

function ENT:Initialize()

	self:basicSetup()

end




--all attributes

--[[ENT.attribs = {

	/*

	["stm"] = 0,

	["str"] = 0,

	["accuracy"] = 0,

	["end"] = 0,

	["luck"] = 0,

	["perception"] = 0,

	["fortitude"] = 0,

	["medical"] = 0,

	*/

}]]



--[[ENT.dmg = {

	-- ["Rifle"] = 1,

}]]



--[[ENT.res = {

	/*

	["Pistol"] = 0,

	["SMG"] = 0,

	["Rifle"] = 0,

	["Shotgun"] = 0,

	["Sniper"] = 0,

	["Explosive"] = 0,

	["Energy"] = 0,

	

	["PhysicalMelee"] = 0,

	["EnergyMelee"] = 0,

	*/

}]]



--[[ENT.actions = {

	/*

	"defense",

	"attack",

	*/

}]]

