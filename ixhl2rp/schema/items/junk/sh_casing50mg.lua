ITEM.name = "Box of .50 MG Casings"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.description = "A box of .50 MG casings, only good for handloading this exceptionally long and wide rifle round."
ITEM.category = "junk"
ITEM.flag = "1"
ITEM.price = 5
ITEM.width = 1
ITEM.height = 1
if (CLIENT) then
	function ITEM:PaintOver(item, w, h)

		draw.SimpleText(".50 MG", "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end