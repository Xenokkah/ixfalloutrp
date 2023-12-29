ITEM.name = "Pip-Boy 3000"
ITEM.model = "models/vex/seventysix/pipboy/pipboy2000.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 1750
ITEM.category = "Electronics"
ITEM.flag = "1"
ITEM.repairCost = ITEM.price/100*1
ITEM.weight = 0.25
ITEM.exRender = true
ITEM.iconCam = {
	pos = Vector(8.27, 0.12, 107.68),
	ang = Angle(85.6, 180.94, 0),
	fov = 4.29
}

ITEM.flag = "1"

local function getText(togga)
	if (togga) then
		return "<color=39, 174, 96>" .. L"on" .. "</color>"
	else
		return "<color=192, 57, 43>" .. L"off" .. "</color>"
	end
end

function ITEM:GetDescription()
	local str
	
	if (!self.entity or !IsValid(self.entity)) then
		str = "A wrist-mounted computing device with a variety of features. \nPower: %s\nFrequency: %s"
		return Format(str, (self:GetData("power") and "On" or "Off"), self:GetData("freq", "000.0"))
	else
		local data = self.entity:GetData()
		
		str = "A wrist-mounted computing device with a variety of features. Power: %s Frequency: %s"
		return Format(str, (self.entity:GetData("power") and "On" or "Off"), self.entity:GetData("freq", "000.0"))
	end
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)
		if (item:GetData("power", false)) then
			surface.SetDrawColor(110, 255, 110, 100)
		else
			surface.SetDrawColor(255, 110, 110, 100)
		end

		surface.DrawRect(w - 14, h - 14, 8, 8)
	end

	local GLOW_MATERIAL = Material("sprites/glow04_noz.vmt")
	local COLOR_ACTIVE = Color(0, 255, 0)
	local COLOR_INACTIVE = Color(255, 0, 0)

	function ITEM:DrawEntity(entity, item)
		entity:DrawModel()
		local rt = RealTime()*100
		local position = entity:GetPos() + entity:GetForward() * 0 + entity:GetUp() * 2 + entity:GetRight() * 0

		if (entity:GetData("power", false) == true) then
			if (math.ceil(rt/14)%10 == 0) then
				render.SetMaterial(GLOW_MATERIAL)
				render.DrawSprite(position, rt % 14, rt % 14, entity:GetData("power", false) and COLOR_ACTIVE or COLOR_INACTIVE)
			end
		end
	end
end

-- Radio Stuff --
ITEM.functions.toggle = { -- sorry, for name order.
	name = "Toggle",
	tip = "useTip",
	icon = "icon16/accept.png",
	OnRun = function(item)
		item:SetData("power", !item:GetData("power", false), nil, nil)
		item.player:EmitSound("buttons/button14.wav", 70, 150)

		return false
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}


ITEM.functions.use = { -- sorry, for name order.
	name = "Freq",
	tip = "useTip",
	icon = "icon16/wrench.png",
	OnRun = function(item)
		netstream.Start(item.player, "radioAdjust", item:GetData("freq", "000,0"), item.id)

		return false
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

-- Geiger Counter --
ITEM.functions.Geiger = {
	name = "Use Geiger Counter",
	tip = "Check your rads.",
	icon = "icon16/error.png",
	OnRun = function(item)
		
		item.player:Notify("Your current rad level is: " ..item.player:GetCharacter():GetRads() .. " rads"  )

		return false
	end,
	OnCanRun = function(item)
		if(item.entity) then
			return false
		end
		return true
	end
}  


-- Music Player Stuff --

ITEM.functions.play = {
    name = "Play Tape",
    tip = "useTip",
    icon = "icon16/control_play.png",
    OnCanRun = function(item)				
		return (!IsValid(item.entity) and item:GetData("CurTape", nil) != nil)
	end,
    OnRun = function(item)
    	local entity = item.player
		local curtape = item:GetData("CurTape", nil)
		local tape = ix.item.list[curtape]

		if entity.sound then
			entity.sound:Stop()
		end

		tape.options = {}
		for k, v in pairs(tape.cassette_options) do
			tape.options[#tape.options + 1] = k
		end

		entity.CurCassette = data
		entity.sound = CreateSound(entity, table.Random(tape.options))
		entity.sound:Play()
		entity.sound:SetSoundLevel(0)
		entity:EmitSound("stalkersound/inv_properties.mp3", 40)
		
		return false
	end,
}

ITEM.functions.insert = {
    name = "Insert Tape",
    tip = "useTip",
    icon = "icon16/arrow_up.png",
    isMulti = true,
    OnCanRun = function(item)				
		return (!IsValid(item.entity) and item:GetData("CurTape", nil) == nil)
	end,
	multiOptions = function(item, client)
		local targets = {}
        local char = client:GetCharacter()
		
        if (char) then
			local inv = char:GetInventory()

			if (inv) then
				local items = inv:GetItems()

				for k, v in pairs(items) do
					if v.isCassette then
						table.insert(targets, {
							name = v.name,
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
    OnRun = function(item, data)
		if !data[1] then
			return false
		end

		local target = data[1]
		local items = item.player:GetCharacter():GetInventory():GetItems()

		for k, invItem in pairs(items) do
			if (data[1]) then
				if (invItem:GetID() == data[1]) then
					target = invItem

					break
				end
			else
				client:Notify("No item selected.")
				return false
			end
		end

		item:SetData("CurTape", target.uniqueID)
		target:Remove()
		item.player:EmitSound("stalkersound/inv_slot.mp3", 40)
		
		return false
	end,
}

ITEM.functions.remove = {
    name = "Remove Tape",
    tip = "useTip",
    icon = "icon16/arrow_down.png",
    OnCanRun = function(item)				
		return (!IsValid(item.entity) and item:GetData("CurTape", nil) != nil)
	end,
    OnRun = function(item, data)
		local inv = item.player:GetCharacter():GetInventory()
		local curtape = item:GetData("CurTape", nil)
		item:StopSound()

		inv:Add(curtape)
		item:SetData("CurTape", nil)
		item.player:EmitSound("stalkersound/inv_slot.mp3", 40)
		
		return false
	end,
}

ITEM.functions.stopsound = {
    name = "Stop Playing",
    tip = "useTip",
    icon = "icon16/control_stop.png",
    OnCanRun = function(item)
		return (!IsValid(item.entity) and item:GetData("CurTape", nil) != nil)
	end,
    OnRun = function(item, data)
		item:StopSound()
		item.player:EmitSound("stalkersound/inv_properties.mp3", 40)
		
		return false
	end,
}

ITEM:Hook("drop", function(item)
	item:StopSound()
end)

function ITEM:StopSound()
	local entity = self.player
	if entity.sound then
		entity.sound:Stop()
	end
end

-- Other Item Functions -- 


ITEM.functions.Sell = {
	name = "Sell",
	icon = "icon16/money.png",
	sound = "physics/metal/chain_impact_soft2.wav",
	OnRun = function(item)
		local client = item.player
		local sellprice = item.price
		sellprice = math.Round(sellprice*0.25)
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
		local sellprice = item:GetData("RealPrice") or item.price
		sellprice = math.Round(sellprice*0.25)
		client:Notify( "Item is sellable for "..(sellprice).." rubles." )
		return false
	end,
	OnCanRun = function(item)
		return !IsValid(item.entity) and item:GetOwner():GetCharacter():HasFlags("1")
	end
}