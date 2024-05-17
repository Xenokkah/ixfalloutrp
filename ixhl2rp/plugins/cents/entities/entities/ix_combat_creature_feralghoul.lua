local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Feral Ghoul"
ENT.Category = "Helix - Combat Entities"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Name Me"
ENT.description = "A Cent."

ENT.models = {
    "models/fallout/ghoulferal.mdl"
}
ENT.WalkAnim = "walk"
ENT.RunAnim = "run"
ENT.IdleAnim = "mtidle"
ENT.AttackAnim = "h2hequip"
ENT.CrouchAnim = "specialidle_crouchidle"
ENT.StandAnim = "specialidle_crouch2stand"


function ENT:OnTakeDamage(dmgInfo)
    return 0
end

if (SERVER) then
    function ENT:CustomInitialize()
        
    end
end