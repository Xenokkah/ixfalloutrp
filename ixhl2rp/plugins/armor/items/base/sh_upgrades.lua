local PLUGIN = PLUGIN

ITEM.name = "FNUpgrade"
ITEM.description = "An attachment. It goes on a weapon."
ITEM.category = "Attachments"
ITEM.model = "models/Items/BoxSRounds.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 1
ITEM.slot = 1
ITEM.quantity = 1
ITEM.flag = "2"
ITEM.isAttachment = true


-- Slot Numbers Defined

-- Armor Vest: 1
-- Mask: 2
-- Helmet: 3
-- Misc: 4

local function attachment(item, data, combine)
    local client = item.player
    local char = client:GetChar()
    local inv = char:GetInv()
    local items = inv:GetItems()
    local target

    for k, invItem in pairs(items) do
        if data then
            if (invItem:GetID() == data[1]) then
                target = invItem
                break
            end
        end
    end
	
    if (!target.isArmor) then
        client:NotifyLocalized("noArmorTarget")
        return false
    else


        -- Make sure armor is not currently on, to avoid fuckery of trying to modify protection values while someone's actively using it
        if target:GetData("equip", false) then
            client:NotifyLocalized("Unequip the armor before modifying it.")
            return false
        end 
             
        local mods = target:GetData("mod", {})
        -- Is the Armor Slot Filled?
        if (mods[item.slot]) then
            client:NotifyLocalized("Slot Filled")
            return false
        end
        
        curPrice = target:GetData("RealPrice")
	    if !curPrice then
		    curPrice = target.price
		end
		
        target:SetData("RealPrice", (curPrice + item.price))
        
        mods[item.slot] = {item.uniqueID, item.name}
        target:SetData("mod", mods)
        local itemweight = item.weight or 0
        local targetweight = target:GetData("weight",target.weight)
		local weightreduc = 0
		
		if item.weightreduc then
			weightreduc = item.weightreduc
		end
		
		local totweight = ((itemweight + targetweight) - weightreduc)
		
        target:SetData("weight", totweight)

        if item.dT then
            local oldMax = target:GetData("maxDt", 0)
            target:SetData("maxDt", oldMax + item.dT)
            if target:GetData("dT") == oldMax then
                target:SetData("dT", item.dT + oldMax)
            end 
        end 

        if item.eT then
            local oldMax = target:GetData("maxEt", 0)
            target:SetData("maxEt", oldMax + item.eT)
            if target:GetData("eT") == oldMax then
                target:SetData("eT", item.eT + oldMax)
            end 
        end 

        if item.dR then
            local oldMax = target:GetData("maxDr", 0)
            target:SetData("maxDr", oldMax + item.dR)
            target:SetData("dR", oldMax + item.dR)
            if target:GetData("dR") == oldMax then
                target:SetData("dR", item.dR + oldMax)
            end 
        end 

        if item.radResist then
            target:SetData("radResist", target:GetData("radResist", 0) + item.radResist)
        end 

        if item.weightDebuff  then
            target:SetData("weightClass", target:GetData("weightClass") + item.weightDebuff)
            if target.weightClass > 4 then target.weightClass = 4 end
        end 
        
		client:EmitSound("cw/holster4.wav")
        return true
    end
	char:setRPGValues()
    client:NotifyLocalized("noArmor")
    return false
end

ITEM.functions.Upgrade = {
    name = "Upgrade",
    tip = "Puts this upgrade on the specified piece of armor.",
    icon = "icon16/wrench.png",
    
    
    OnCanRun = function(item)
        return (!IsValid(item.entity))
    end,
	
    OnRun = function(item, data)
		return attachment(item, data, false)
	end,
    
    isMulti = true,
    
    multiOptions = function(item, client)
        --local client = item.player
        local targets = {}
        local char = client:GetChar()
        if (char) then
            local inv = char:GetInv()
            if (inv) then
                local items = inv:GetItems()

                for k, v in pairs(items) do
                    if v.isBodyArmor and item.isArmorUpg then
                        table.insert(targets, {
                            name = L(v.name),
                            data = {v:GetID()},
                        })
                    elseif v.isHelmet and item.isHelmetUpg then
                        table.insert(targets, {
                            name = L(v.name),
                            data = {v:GetID()},
                        })
                    elseif v.isGasmask and item.isGasmaskUpg then
						table.insert(targets, {
                            name = L(v.name),
                            data = {v:GetID()},
                        })
                    elseif v.isMisc and item.isMiscUpg then
						table.insert(targets, {
                            name = L(v.name),
                            data = {v:GetID()},
                        })
					else
						continue
					end
				end
			end
		end
    return targets
	end,
}

ITEM.functions.Sell = {
	name = "Sell",
	icon = "icon16/stalker/sell.png",
	sound = "physics/metal/chain_impact_soft2.wav",
	OnRun = function(item)
		local client = item.player
		local sellprice = (item.price/2)
		sellprice = math.Round(sellprice)
		client:Notify( "Sold for "..(sellprice).." rubles." )
		client:GetCharacter():GiveMoney(sellprice)
		
	end,
	OnCanRun = function(item)
		return !IsValid(item.entity) and item:GetOwner():GetCharacter():HasFlags("1")
	end
}

ITEM.functions.Value = {
	name = "Value",
	icon = "icon16/help.png",
	sound = "physics/metal/chain_impact_soft2.wav",
	OnRun = function(item)
		local client = item.player
		local sellprice = (item.price/2)
		sellprice = math.Round(sellprice)
		client:Notify( "Item is sellable for "..(sellprice).." rubles." )
		return false
	end,
	OnCanRun = function(item)
		return !IsValid(item.entity) and item:GetOwner():GetCharacter():HasFlags("1")
	end
}

function ITEM:GetDescription()
	local description = self.description
	
    if self.dT then
        description = description .. "\n+" .. self.dT .. " DT"
    end 

    if self.eT then
        description = description .. "\n+" .. self.eT .. " ET"
    end 

    if self.dR then
        description = description .. "\n+" .. self.dR .. "% DR"
    end 
    if self.radResist then
        description = description .. "\n+" .. self.radResist .. "% Radiation Resistance"
    end 

    if self.weightDebuff then
        description = description .. "\n+" .. self.weightDebuff .. " Weight Class"
    end 
	return description
end