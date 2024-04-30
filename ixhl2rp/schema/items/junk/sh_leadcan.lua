ITEM.name = "Can of Lead Powder"
ITEM.model = "models/mosi/fallout4/props/junk/tincan03.mdl"
ITEM.description = "A can of powdered lead, used for handloading conventional ammunition."
ITEM.category = "junk"
ITEM.flag = "1"
ITEM.price = 5
ITEM.width = 1
ITEM.height = 1
if (CLIENT) then
	function ITEM:PaintOver(item, w, h)

		draw.SimpleText("Lead", "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end