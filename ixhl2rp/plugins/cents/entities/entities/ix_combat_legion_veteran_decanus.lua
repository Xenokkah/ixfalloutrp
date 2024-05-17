local PLUGIN = PLUGIN

ENT.Type = "nextbot"
ENT.Base = "ix_combat_base"
ENT.PrintName = "Veteran Decanus"
ENT.Category = "Helix - Combat Entities - Caesar's Legion"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Veteran Decanus"
ENT.description = "A Veteran Decanus, leader of a squad of Veterans."

ENT.models = {
    "models/gore/we_are_legion/veteran_decanus_pm.mdl"
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
    "models/halokiller38/fallout/weapons/smgs/bm_127smg.mdl",
    "models/halokiller38/fallout/weapons/shotguns/bm_riotshotgun.mdl",
    "models/halokiller38/fallout/weapons/pistols/bm_127mmpistol.mdl",
    "models/halokiller38/fallout/weapons/rifles/bm_brushgun.mdl",
    "models/halokiller38/fallout/weapons/assaultrifles/bm_assaultcarbineext.mdl"
}


local names = {
    "Gaius",
    "Lucius",
    "Marcus",
    "Publius",
    "Quintus",
    "Titus",
    "Tiberius",
    "Sextus",
    "Aulus",
    "Postumus",
    "Decimus",
    "Gnaeus",
    "Tertius",
    "Spurius",
    "Manius",
    "Servius",
    "Appius",
    "Numerius",
    "Vibius",
    "Primus",
    "Aelius",
    "Calpurius",
    "Moravius",
    "Naevius",
    "Caecilius",
    "Tullius",
    "Vibius",
    "Livius",
    "Lucilius",
    "Durmius",
    "Fabius",
    "Velleius",
    "Calidius",
    "Capenius",
    "Furius",
    "Galerius",
    "Domitius",
    "Fannius",
    "Cordius",
    "Larcius",
    "Albius",
    "Amatius",
    "Cornelius",
    "Laelius",
    "Flavius",
    "Aemilius",
    "Caelius",
    "Tuccius",
    "Curius",
    "Decius",
    "Fidelius",
    "Fulvius",
    "Gellius",
    "Horatius",
    "Manlius",
    "Hortensius",
    "Marcius",
    "Labenius",
    "Seius",
    "Luventius",
    "Ambrosius",
    "Memmius",
    "Lulius",
    "Sertorious",
    "Lucretius",
    "Marius",
    "Meridius",
    "Sempronius",
    "Pontius",
    "Numerius",
    "Octavius",
    "Popillius",
    "Annius",
    "Sergius",
    "Lucius",
    "Modius",
    "Licinius",
    "Scribonius",
    "Lunius",
    "Ovidius",
    "Antonius",
    "Papirius",
    "Sentius",
    "Minius",
    "Porcius",
    "Vipsanius",
    "Vitellius",
    "Petronius",
    "Verginius",
    "Rufius",
    "Appolonius",
    "Pompilius",
    "Postumius",
    "Rubellius",
    "Quintilius",
    "Rutilius",
    "Salvius",
    "Ursius",
    "Quintius",
    "Servilius",
    "Servius",
    "Arrius",
    "Claudius",
    "Silvius",
    "Suetonius",
    "Cassius",
    "Tarquitius",
    "Titinius",
    "Asinius",
    "Spurius",
    "Villius",
    "Atilius",
    "Ulpius",
    "Valerius",
    "Terentius",
    "Aurelius",
    "Vergilius",
    "Gratius",
    "Herennius",
    "Vitruvius"
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
        self:SetCombatHealthMax(115)
        self:SetCombatHealth(115)
        self:SetAP(10)
        self:SetDT(15)
        self:SetET(6)
        self:SetAttackBoost(20)
        self:SetDodgeBoost(20)
       
    end
end