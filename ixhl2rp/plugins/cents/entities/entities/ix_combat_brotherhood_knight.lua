local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Brotherhood Knight"
ENT.Category = "Helix - Combat Entities - Brotherhood of Steel"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Brotherhood Knight"
ENT.description = "A Brotherhood Knight, technical and combat capable."

ENT.models = {
    "models/thespireroleplay/humans/group053/female_01.mdl",
    "models/thespireroleplay/humans/group053/female_02.mdl",
    "models/thespireroleplay/humans/group053/female_03.mdl",
    "models/thespireroleplay/humans/group053/female_04.mdl",
    "models/thespireroleplay/humans/group053/female_05.mdl",
    "models/thespireroleplay/humans/group053/female_06.mdl",
    "models/thespireroleplay/humans/group053/female_07.mdl",
    "models/thespireroleplay/humans/group053/female_08.mdl",
    "models/thespireroleplay/humans/group053/female_09.mdl",
    "models/thespireroleplay/humans/group053/female_10.mdl",
    "models/thespireroleplay/humans/group053/female_11.mdl",
    "models/thespireroleplay/humans/group053/female_12.mdl",
    "models/thespireroleplay/humans/group053/male_01.mdl",
    "models/thespireroleplay/humans/group053/male_02.mdl",
    "models/thespireroleplay/humans/group053/male_03.mdl",
    "models/thespireroleplay/humans/group053/male_04.mdl",
    "models/thespireroleplay/humans/group053/male_05.mdl",
    "models/thespireroleplay/humans/group053/male_06.mdl",
    "models/thespireroleplay/humans/group053/male_07.mdl",
    "models/thespireroleplay/humans/group053/male_08.mdl",
    "models/thespireroleplay/humans/group053/male_09.mdl",
    "models/thespireroleplay/humans/group053/male_10.mdl",
    "models/thespireroleplay/humans/group053/male_11.mdl",
    "models/thespireroleplay/humans/group053/male_12.mdl",
    "models/thespireroleplay/humans/group053/male_13.mdl",
    "models/thespireroleplay/humans/group053/male_14.mdl",
    "models/thespireroleplay/humans/group053/male_15.mdl",
    "models/thespireroleplay/humans/group053/male_16.mdl",
    "models/thespireroleplay/humans/group053/male_17.mdl",
    "models/thespireroleplay/humans/group053/male_18.mdl",
    "models/thespireroleplay/humans/group053/male_19.mdl",

}
ENT.WalkAnim = "walkalerthold_ar2_all1"
ENT.RunAnim = "run_holding_ar2_all"
ENT.IdleAnim = "idle_relaxed_ar2_"..math.random(1, 9)
ENT.AttackAnim = "shoot_ar2"
ENT.CrouchAnim = "crouch_idled"
ENT.StandAnim = "crouchtostand"




function ENT:OnTakeDamage(dmgInfo)
    return 0
end

local weapons = {
    "models/halokiller38/fallout/weapons/energy weapons/bm_laserrifle.mdl",
    "models/halokiller38/fallout/weapons/assaultrifles/bm_r91assaultrifle.mdl"
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
            self.IdleAnim = "idle_angry"
            self.AttackAnim = "idle_revolver"
            self.RunAnim = "run_all_02"
            self.WalkAnim = "walk_all_moderate"
        end

        self:SetCEntName(self.name .. " " .. table.Random(names))
        self:SetCEntWeaponModel(chosenweapon)
        self:SetCombatHealthMax(85)
        self:SetCombatHealth(85)
        self:SetAP(8)
        self:SetDT(18)
        self:SetET(15)
        self:SetDR(9)
        self:SetAttackBoost(10)
        self:SetDodgeBoost(10)
       
    end
end