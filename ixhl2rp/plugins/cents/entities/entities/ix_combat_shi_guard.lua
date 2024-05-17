local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Shi Guard"
ENT.Category = "Helix - Combat Entities - Misc Faction"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Shi Guard"
ENT.description = "A hardy member of the Shi Guard, the well-trained security force of the Shi."

ENT.models = {
    "models/nikout/fallout/wintercombatarmormale.mdl"
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
    "models/halokiller38/fallout/weapons/assaultrifles/bm_r91assaultrifle.mdl",
    "models/halokiller38/fallout/weapons/energy weapons/bm_laserrifle.mdl"
}

local names = {
    "Ling",
    "Chun",
    "Hsin",
    "Lee",
    "Huang",
    "Li",
    "Wang",
    "Zhang",
    "Liu",
    "Chen",
    "Yang",
    "Huang",
    "Zhao",
    "Zhou",
    "Wu",
    "Xu",
    "Sun",
    "Zhu",
    "Ma",
    "Hu",
    "Guo",
    "Lin",
    "He"
}

if (SERVER) then
    function ENT:CustomInitialize()
        self:SetCEntName(self.name .. " " .. table.Random(names))
        local chosenweapon = table.Random(weapons)
        self:SetCEntWeaponModel(chosenweapon)
        self:SetCombatHealthMax(85)
        self:SetCombatHealth(85)
        self:SetDR(8)
        self:SetDT(18)
        self:SetET(13)
        self:SetAttackBoost(10)
        self:SetDodgeBoost(10)
       
    end
end