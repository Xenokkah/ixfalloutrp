ITEM.name = "Cigar Box"
ITEM.description = "A wooden box containing some cigars."
ITEM.longdesc = "A nice wooden box containing pre-war Cuban import cigars. The esteemed 'Hoja Dulce' (or 'Sweet Leaf') brand cigar is a statement of power and class, and a box is packaged with five well-preserved cigars. Often held as a display piece or taken out for serious talks and celebrations."
ITEM.model = "models/mosi/fallout4/props/junk/cigarcarton.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 5
ITEM.sound = "fosounds/fix/ui_items_generic_up_02.mp3"
ITEM.weight = 0.05


ITEM.functions.use = {
	name = "Take Out Cigar",
	icon = "icon16/heart.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "retrieves a cigar from their "..item.name..".", false)

		curplayer = item.player:GetCharacter()
		
	
		curplayer:GetInventory():Add("cigar", 1)
		quantity = quantity - 1
		if (quantity >= 1) then
			item:SetData("quantity", quantity)
			return false
		end
			return true
		end,

	OnCanRun = function(item)
		return (!IsValid(item.entity))
	end
}


function ITEM:GetDescription()
	if (!self.entity or !IsValid(self.entity)) then
		local quant = self:GetData("quantity", self.quantity)
		local str = self.longdesc.."\n \nThere's only "..quant.." uses left."

		return str
	else
		return self.description
	end
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)
		draw.SimpleText(item:GetData("quantity", item.quantity).."/"..item.quantity, "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end