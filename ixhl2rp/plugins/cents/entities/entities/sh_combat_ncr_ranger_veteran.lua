local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "NCR Veteran Ranger"
ENT.Category = "Helix - Combat Entities - New California Republic"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "NCR Ranger"
ENT.description = "An NCR Ranger, hardened, well equipped, and skilled. Eats nails and shits napalm."

ENT.models = {
    "models/ncr/rangercombatarmor.mdl",
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
    "models/halokiller38/fallout/weapons/pistols/bm_rangersequoia.mdl",
    "models/halokiller38/fallout/weapons/rifles/bm_trailcarbine.mdl",
    "models/halokiller38/fallout/weapons/shotguns/bm_riotshotgun.mdl",
    "models/halokiller38/fallout/weapons/sniperrifles/bm_sniperriflecarbonfiber.mdl"
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
            ENT.WalkAnim = "walk_all"
            ENT.RunAnim = "run_all"
            ENT.IdleAnim = "idle_subtle"
            ENT.AttackAnim = "shootp1"
            ENT.CrouchAnim = "crouch_idled"
            ENT.StandAnim = "crouchtostand"
        end

        if chosenweapon == "" then
            self.IdleAnim = "idle_angry"
            self.AttackAnim = "idle_melee_angry"
            self.RunAnim = "run_all_02"
            self.WalkAnim = "walk_all_moderate"
        end 


        self:SetCEntName(self.name .. " " .. table.Random(names))
        self:SetCEntWeaponModel(chosenweapon)
        self:SetCombatHealthMax(125)
        self:SetCombatHealth(125)
        self:SetAP(11)
        self:SetDT(24)
        self:SetET(16)
        self:SetDR(12)
        self:SetAttackBoost(25)
        self:SetDodgeBoost(15)
       
    end
end