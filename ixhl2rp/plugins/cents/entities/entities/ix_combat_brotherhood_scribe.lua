local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Brotherhood Scribe"
ENT.Category = "Helix - Combat Entities - Brotherhood of Steel"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Brotherhood Scribe"
ENT.description = "A Brotherhood scribe."

ENT.models = {
    "models/halokiller38/fallout/scribe/scribe_01.mdl",
    "models/halokiller38/fallout/scribe/scribe_02.mdl",
    "models/halokiller38/fallout/scribe/scribe_03.mdl",
    "models/halokiller38/fallout/scribe/scribe_04.mdl",
    "models/halokiller38/fallout/scribe/scribe_05.mdl",
    "models/halokiller38/fallout/scribe/scribe_06.mdl",
    "models/halokiller38/fallout/scribe/scribe_07.mdl",
    "models/halokiller38/fallout/scribe/scribe_08.mdl",
    "models/halokiller38/fallout/scribe/scribe_09.mdl"
}
ENT.WalkAnim = "walk_passive"
ENT.RunAnim = "run_holding_ar2_all"
ENT.IdleAnim = "idle_passive"
ENT.AttackAnim = "idle_ar2"
ENT.CrouchAnim = "cidle_all"
ENT.StandAnim = "crouchtostand"



function ENT:OnTakeDamage(dmgInfo)
    return 0
end

local weapons = {
    "models/halokiller38/fallout/weapons/energy weapons/bm_rechargerrifle.mdl",
    "models/halokiller38/fallout/weapons/energy weapons/bm_laserpistol.mdl",
}


local names = {
"Smith",
"Marshall",
"Brown",
"Stevenson",
"Wilson",
"Wood",
"Thomson",
"Sutherland",
"Robertson",
"Craig",
"Campbell",
"Wright",
"Stewart",
"Mckenzie",
"Anderson",
"Kennedy",
"Macdonald",
"Jones",
"Scott",
"Burns",
"Jones",
"Williams",
"Davies",
"Evans",
"Thomas",
"Roberts",
"Hughes",
"Lewis",
"Morgan",
"Griffiths",
"Richards",
"Powell",
"Parry",
"John",
"Watkins",
"Howells",
"Pritchard",
"Rogers",
"Matthews",
"Rowlands",
"Smith",
"Jones",
"Williams",
"Taylor",
"Brown",
"Davies",
"Evans",
"Wilson",
"Thomas",
"Johnson",
"Roberts",
"Robinson",
"Thompson",
"Wright",
"Walker",
"White",
"Edwards",
"Hughes",
"Green",
"Hall",
"Edwards",
"Owen",
"James",
"Morris",
"Price",
"Rees",
"Phillips",
"Jenkins",
"Harris",
"Lloyd",
"Humphries",
"Pugh",
"Ellis",
"Bowen",
"Hopkins",
"Martin",
"Bennett",
"Bevan",
"Pearse",
"Adams"
}

if (SERVER) then
    function ENT:CustomInitialize()

        local chosenweapon = table.Random(weapons)
        if string.find(chosenweapon, "pistol") then
            self.WalkAnim = "walk_all"
            self.RunAnim = "run_all"
            self.IdleAnim = "idle_subtle"
            self.AttackAnim = "shootp1"
            self.CrouchAnim = "crouch_idled"
            self.StandAnim = "crouchtostand"
        end

        self:SetCEntName(self.name .. " " .. table.Random(names))
        self:SetCEntWeaponModel(chosenweapon)
        self:SetCombatHealthMax(75)
        self:SetCombatHealth(75)
        self:SetAP(7)
        self:SetDT(2)
        self:SetET(2)
        self:SetAttackBoost(5)
        self:SetDodgeBoost(5)
       
    end
end