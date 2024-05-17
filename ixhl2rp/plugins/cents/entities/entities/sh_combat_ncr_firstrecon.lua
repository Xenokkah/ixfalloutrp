local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "First Recon Sniper"
ENT.Category = "Helix - Combat Entities - New California Republic"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "First Recon Sniper"
ENT.description = "A First Recon member, signified by their red beret. The last thing you never see."

ENT.models = {
    "models/gore/ncr/10ofspades.mdl",
    "models/gore/ncr/boone.mdl",
    "models/gore/ncr/mojave_1streconf.mdl",
    "models/gore/ncr/mojave_1streconf_02.mdl",
    "models/gore/ncr/mojave_1streconm.mdl",
    "models/gore/ncr/talon_1strecon.mdl",
    "models/gore/ncr/talon_1streconf.mdl",
    "models/gore/ncr/vargas.mdl",
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
    "models/halokiller38/fallout/weapons/rifles/bm_huntingrifle.mdl",
    "models/halokiller38/fallout/weapons/rifles/bm_cowboyrepeaterunique.mdl",
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
        self:SetDT(10)
        self:SetET(6)
        self:SetDR(5)
        self:SetAttackBoost(15)
        self:SetDodgeBoost(15)
       
    end
end