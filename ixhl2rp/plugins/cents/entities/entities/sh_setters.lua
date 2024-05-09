local PLUGIN = PLUGIN

ENT.Spawnable = false

function ENT:SetCEntName(value)
    return self:SetNetVar("name", value)
end

function ENT:SetDescription(value)
    return self:SetNetVar("desc", value)
end

function ENT:SetCombatHealth(value)
    return self:SetNetVar("hp", value)
end

function ENT:SetCombatHealthMax(value)
    return self:SetNetVar("maxhp", value)
end

function ENT:SetWeapon(value)
    return self:EquipWeapon(value, self:GetNetVar("weaponModel", "models/Items/AR2_Grenade.mdl"))
end

function ENT:SetCEntWeaponModel(value)
    return self:EquipWeapon(self:GetNetVar("weapon", false), value)
end

function ENT:SetAttributes(tbl)
    return self:SetNetVar("attributes", tbl)
end

function ENT:SetSkills(tbl)
    return self:SetNetVar("skills", tbl)
end

function ENT:SetSP(tbl)
    return self:SetNetVar("sp", tbl)
end