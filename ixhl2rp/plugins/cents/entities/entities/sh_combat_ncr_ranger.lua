local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "NCR Ranger"
ENT.Category = "Helix - Combat Entities - New California Republic"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "NCR Ranger"
ENT.description = "An NCR Ranger, hardened, well equipped, and skilled."

ENT.models = {
    "models/thespireroleplay/humans/group054/female_01.mdl",
    "models/thespireroleplay/humans/group054/female_02.mdl",
    "models/thespireroleplay/humans/group054/female_03.mdl",
    "models/thespireroleplay/humans/group054/female_04.mdl",
    "models/thespireroleplay/humans/group054/female_05.mdl",
    "models/thespireroleplay/humans/group054/female_06.mdl",
    "models/thespireroleplay/humans/group054/female_07.mdl",
    "models/thespireroleplay/humans/group054/female_08.mdl",
    "models/thespireroleplay/humans/group054/female_09.mdl",
    "models/thespireroleplay/humans/group054/female_10.mdl",
    "models/thespireroleplay/humans/group054/female_11.mdl",
    "models/thespireroleplay/humans/group054/female_12.mdl",
    "models/thespireroleplay/humans/group054/male_01.mdl",
    "models/thespireroleplay/humans/group054/male_02.mdl",
    "models/thespireroleplay/humans/group054/male_03.mdl",
    "models/thespireroleplay/humans/group054/male_04.mdl",
    "models/thespireroleplay/humans/group054/male_05.mdl",
    "models/thespireroleplay/humans/group054/male_06.mdl",
    "models/thespireroleplay/humans/group054/male_07.mdl",
    "models/thespireroleplay/humans/group054/male_08.mdl",
    "models/thespireroleplay/humans/group054/male_09.mdl",
    "models/thespireroleplay/humans/group054/male_10.mdl",
    "models/thespireroleplay/humans/group054/male_11.mdl",
    "models/thespireroleplay/humans/group054/male_12.mdl",
    "models/thespireroleplay/humans/group054/male_13.mdl",
    "models/thespireroleplay/humans/group054/male_14.mdl",
    "models/thespireroleplay/humans/group054/male_15.mdl",
    "models/thespireroleplay/humans/group054/male_16.mdl",
    "models/thespireroleplay/humans/group054/male_17.mdl",
    "models/thespireroleplay/humans/group054/male_18.mdl",
    "models/thespireroleplay/humans/group054/male_19.mdl",
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
    "models/halokiller38/fallout/weapons/assaultrifles/bm_assaultcarbineext.mdl",
    "models/halokiller38/fallout/weapons/rifles/bm_trailcarbine.mdl",
    "models/halokiller38/fallout/weapons/shotguns/bm_huntingshotgunextchoke.mdl",
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
        if string.find(chosenweapon, "revolver") then
            self.IdleAnim = "idle_angry"
            self.AttackAnim = "idle_revolver"
            self.RunAnim = "run_all_02"
            self.WalkAnim = "walk_all_moderate"
        end

        if chosenweapon == "" then
            self.IdleAnim = "idle_angry"
            self.AttackAnim = "idle_melee_angry"
            self.RunAnim = "run_all_02"
            self.WalkAnim = "walk_all_moderate"
        end 


        self:SetCEntName(self.name .. " " .. table.Random(names))
        self:SetCEntWeaponModel(chosenweapon)
        self:SetCombatHealthMax(110)
        self:SetCombatHealth(110)
        self:SetAP(10)
        self:SetDT(16)
        self:SetET(10)
        self:SetDR(8)
        self:SetAttackBoost(15)
        self:SetDodgeBoost(15)
       
    end
end