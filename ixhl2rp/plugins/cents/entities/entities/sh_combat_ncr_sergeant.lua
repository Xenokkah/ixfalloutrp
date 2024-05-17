local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "NCR Sergeant"
ENT.Category = "Helix - Combat Entities - New California Republic"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "NCR Sergeant"
ENT.description = "A Sergeant, usually a squad leader, afforded better equipment to match their improved skill."

ENT.models = {
    "models/gore/ncr/dark_trooper.mdl",
    "models/gore/ncr/dark_trooperf.mdl",
    "models/gore/ncr/mccredie.mdl",
    "models/gore/ncr/mojave_bandoleer.mdl",
    "models/gore/ncr/mojave_facewrapf.mdl",
    "models/gore/ncr/mojave_facewrapm.mdl",
    "models/gore/ncr/mojave_trooperf.mdl",
    "models/gore/ncr/mojave_trooperm.mdl",
    "models/gore/ncr/ncr_scoutf.mdl",
    "models/gore/ncr/ncr_scoutm.mdl",
    "models/gore/ncr/ohanrahan.mdl",
    "models/gore/ncr/razz.mdl",
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
    "models/halokiller38/fallout/weapons/assaultrifles/bm_marksmancarbineext.mdl",
    "models/halokiller38/fallout/weapons/shotguns/bm_leveractionshotgun.mdl",
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
        self:SetCombatHealthMax(85)
        self:SetCombatHealth(85)
        self:SetAP(9)
        self:SetDT(10)
        self:SetET(6)
        self:SetDR(5)
        self:SetAttackBoost(11)
        self:SetDodgeBoost(11)
       
    end
end