CLASS.name = "Super Mutant"
CLASS.description = "First and Second Gen Super Mutants."
CLASS.isDefault = false
CLASS.faction = FACTION_WASTELAND

function CLASS:OnSet(client)
    char = client:GetCharacter()
    char:SetCharmaxhp(char:GetCharmaxhp() + 25)
    char:SetCharcurrenthp(char:GetCharmaxhp())
    char:SetRadImmune(true)
    client:SetModel("models/fallout/supermutant.mdl")

    char:SetChardt(char:GetChardt() + 6)
    char:SetCharet(char:GetCharet() + 2)
    char:SetChardr(char:GetChardr() + 25)


    char:UpdateAttrib("intelligence", -2)
    char:UpdateAttrib("agility", -2)
    char:UpdateAttrib("charisma", -2)

    char:UpdateAttrib("strength", 3)
    char:UpdateAttrib("endurance", 2)

end 

function CLASS:OnLeave(client)
    char = client:GetCharacter()
    char:SetCharmaxhp(char:GetCharmaxhp() - 25)
    char:SetCharcurrenthp(char:GetCharmaxhp())
    char:SetRadImmune(false)

    char:SetChardt(char:GetChardt() - 6)
    char:SetCharet(char:GetCharet() - 2)
    char:SetChardr(char:GetChardr() - 25)

    char:UpdateAttrib("intelligence", 2)
    char:UpdateAttrib("agility", 2)
    char:UpdateAttrib("charisma", 2)

    char:UpdateAttrib("strength", -3)
    char:UpdateAttrib("endurance", -2)


end 



CLASS_SUPERMUTANT = CLASS.index