ITEM.name = "Caps Stash"
ITEM.description = "A metal tin full of Bottle Caps."
ITEM.longdesc = "With the adoption of Bottle Caps as the Wasteland's primary currency, traditional wallets have long gone out of use for money storage, in favor of things such as sturdy tins to store caps in."
ITEM.model = "models/mosi/fallout4/props/junk/bottlecaptin.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.flag = "A"
ITEM.maxStack = 5000000
ITEM.quantity = 0
ITEM.exRender = true
ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 2.5,
}
ITEM.weight = 0.001

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)
		draw.SimpleText(item:GetData("quantity", 1), "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end

ITEM.functions.use = {
	name = "Put Away",
	icon = "icon16/coins_add.png",
	sound = "physics/metal/chain_impact_soft2.wav",
	OnRun = function(item)
		local position = item.player:GetItemDropPos()
		local client = item.player
		local quant = item:GetData("quantity", 1)
		client:GetCharacter():GiveMoney(quant)
		ix.chat.Send(item.player, "iteminternal", "counts up some Caps and puts them away.", false)
	end,
	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

function ITEM:GetDescription()
	local quant = self:GetData("quantity", 1)
	local str = self.longdesc

	local customData = self:GetData("custom", {})
	if(customData.desc) then
		str = customData.desc
	end

	if (self.entity) then
		local quant = self:GetData("quantity", 1)
		return self.description.."\n \nThis container of caps has a value of "..math.Round(quant).." Caps."
	else
        return (str.."\n\n".."This container of caps has a value of "..math.Round(quant).." Caps.")
	end
end


function ITEM:GetName()
	local name = self.name
	
	local customData = self:GetData("custom", {})
	if(customData.name) then
		name = customData.name
	end
	
	return name
end

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	OnRun = function(item)		
		ix.plugin.list["customization"]:startCustom(item.player, item)
		
		return false
	end,
	
	OnCanRun = function(item)
		local client = item.player
		return client:GetCharacter():HasFlags("N") and !IsValid(item.entity)
	end
}

ITEM.functions.Inspect = {
	name = "Inspect",
	tip = "Inspect this item",
	icon = "icon16/picture.png",
	OnClick = function(item, test)
		local customData = item:GetData("custom", {})

		local frame = vgui.Create("DFrame")
		frame:SetSize(540, 680)
		frame:SetTitle(item.name)
		frame:MakePopup()
		frame:Center()

		frame.html = frame:Add("DHTML")
		frame.html:Dock(FILL)
		
		local imageCode = [[<img src = "]]..customData.img..[["/>]]
		
		frame.html:SetHTML([[<html><body style="background-color: #000000; color: #282B2D; font-family: 'Book Antiqua', Palatino, 'Palatino Linotype', 'Palatino LT STD', Georgia, serif; font-size 16px; text-align: justify;">]]..imageCode..[[</body></html>]])
	end,
	OnRun = function(item)
		return false
	end,
	OnCanRun = function(item)
		local customData = item:GetData("custom", {})
	
		if(!customData.img) then
			return false
		end
		
		if(item.entity) then
			return false
		end
		
		return true
	end
}

ITEM.functions.Clone = {
	name = "Clone",
	tip = "Clone this item",
	icon = "icon16/wrench.png",
	OnRun = function(item)
		local client = item.player	
	
		client:requestQuery("Are you sure you want to clone this item?", "Clone", function(text)
			if text then
				local inventory = client:GetCharacter():GetInventory()
				
				if(!inventory:Add(item.uniqueID, 1, item.data)) then
					client:Notify("Inventory is full")
				end
			end
		end)
		return false
	end,
	OnCanRun = function(item)
		local client = item.player
		return client:GetCharacter():HasFlags("N") and !IsValid(item.entity)
	end
}