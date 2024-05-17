local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Shi Technician"
ENT.Category = "Helix - Combat Entities - Misc Faction"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Shi Technician"
ENT.description = "A civillian Shi specialist skilled in Science or Engineering."

ENT.models = {
    "models/thespireroleplay/humans/group050/male_13.mdl",
    "models/thespireroleplay/humans/group050/female_08.mdl",
    "models/thespireroleplay/humans/group050/male_13.mdl",
    "models/thespireroleplay/humans/group050/male_14.mdl",
    "models/thespireroleplay/humans/group050/female_04.mdl",
    "models/thespireroleplay/humans/group050/female_11.mdl",
    "models/thespireroleplay/humans/group050/male_05.mdl"


}
ENT.WalkAnim = "walk_all"
ENT.RunAnim = "run_all"
ENT.IdleAnim = "idle_subtle"
ENT.AttackAnim = "shootp1"
ENT.CrouchAnim = "crouch_idled"
ENT.StandAnim = "crouchtostand"


function ENT:OnTakeDamage(dmgInfo)
    return 0
end

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
        self:SetCombatHealthMax(45)
        self:SetCombatHealth(45)
        self:SetDT(2)
        self:SetAttackBoost(5)
        self:SetDodgeBoost(5)
        self:SetBodygroup(2,2)
    end
end