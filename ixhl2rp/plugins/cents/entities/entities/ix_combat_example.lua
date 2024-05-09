local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Combat Entity Example"
ENT.Category = "Helix - Combat (Example)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Name Me"
ENT.description = "A Cent."

ENT.models = {
    "models/Humans/Group01/Male_01.mdl",
    "models/Humans/Group01/Male_02.mdl",
    "models/Humans/Group01/Male_03.mdl"
}
ENT.WalkAnim = "walk_all"
ENT.RunAnim = "run_all"
ENT.IdleAnim = "idle_alert_smg1_"..math.random(1, 9)
ENT.AttackAnim = "idle_smg1_aim_alert"


function ENT:OnTakeDamage(dmgInfo)
    return 0
end

if (SERVER) then
    function ENT:CustomInitialize()
        
    end
end